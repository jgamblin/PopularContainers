#!/bin/bash
page=0

#Pull 10 Pages Of Containers With 100 Per Page
while [ $page -lt 10 ]
do
curl -s "https://store.docker.com/api/content/v1/products/search?page_size=100&page=${page}&q=%2B&source=community&type=image%2Cbundle" | jq -r '.summaries | sort_by(-.popularity) | .[].name' >> MostPopularConatiners-"$(date +"%m_%d_%Y")".txt
page=$((page + 1))
done
