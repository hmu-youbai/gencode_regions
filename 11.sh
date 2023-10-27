for file in *.bed; do
    base=$(basename "$file" .bed) # 获取文件的基本名，不包含扩展名
    awk -v basename="$base" 'BEGIN{OFS="\t"} {$5=basename; print}' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
done
