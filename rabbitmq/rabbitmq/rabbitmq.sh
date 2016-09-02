# call "rabbitmqctl stop" when exiting
trap "{ echo Stopping rabbitmq; rabbitmqctl stop; exit 0; }" TERM

echo Starting rabbitmq
rabbitmq-server &

PID=$!
wait $PID
