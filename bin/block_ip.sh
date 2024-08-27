###############################################
# IP 封禁
###############################################

# 封禁阈值
limit=100
# 白名单
ip_white_list=("124.65.178.206" "114.253.67.38" "127.0.0.1")
# 黑名单路径
blockList=/usr/local/nginx/conf/blockList.conf
# 分析的日志
log_file=/usr/local/nginx/logs/access.log
###############################################
tmpFile=tmp001.tmp
tail -n 3000 $log_file | awk '{print $1}' | sort | uniq -c | sort -nr > $tmpFile

while IFS= read -r line
do
    number=$(echo "$line" | awk '{print $1}')

    # 忽略小于阈值的行
    if [ "$number" -lt "$limit" ]; then
        continue 1
    fi

    ip_address=$(echo "$line" | awk '{print $2}')

    # 白名单
    ip_in_list=false
    for ip in "${ip_white_list[@]}"
    do
        if [ "$ip_address" == "$ip" ]; then
            ip_in_list=true
            break
        fi
    done

    # 封禁
    if [ "$ip_in_list" == false ]; then
        echo "blocked $line"
        echo "deny $ip_address;" >> $blockList
        sort $blockList|uniq > tmp002.txt
        mv tmp002.txt $blockList

        # 重启
        nginx -s reload
    fi

done < $tmpFile
rm $tmpFile

