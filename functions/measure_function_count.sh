function measure_function_count() {
  for i in $(find {app,lib} -type f -name "*.rb")
  do
    line_count=$(cat $i | grep -e "^[[:space:]]*def" | wc -l)
    echo "$line_count - $i"
  done | sort -nr
}
