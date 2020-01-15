tag="aaa/bbbb"
base=$(tr '/' '-'<<<${tag})
echo $base
