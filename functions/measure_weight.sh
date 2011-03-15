function measure_weight() {
  for i in $(find {app,lib} -type f -name "*.rb")
  do
    line_count=$(cat $i | grep -ve "^[[:space:]]*#" | grep -v '^$' | wc -l)
    echo "$line_count - $i"
  done | sort -nr
}
