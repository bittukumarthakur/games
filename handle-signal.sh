function handle_interrupt() {
  echo 'I am handling an inter'
}

trap handle_interrupt 9


read -r -p "Enter your name" NAME
echo "\nHello $NAME"
