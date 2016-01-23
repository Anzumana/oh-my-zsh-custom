get_suspended_jobs() {
  # thanks to @mheap for his help
  NUM_JOBS="`jobs | wc -l`"
  if test $NUM_JOBS -lt 1 ; then
    echo ""
  else
    echo "("`jobs | gsed -r 's/ .*suspended (\(signal\))?//' | tr -s ' ' | gsed 's/\[\([^]]*\)\]/\1:/g' | gsed 's/\: /\:/g'`")"
  fi
}
junit_compile () {
	javac -cp .:junit-4.12.jar $1 $2 $3
}
growl_notification() {
	NUM_JOBS="`tmux display-message -p '#S'| cat `"
	growlnotify -n "$NUM_JOBS" -m "Done"
}
junit_execute_tests(){
	java -cp .:junit-4.12.jar:hamcrest-core-1.3.jar org.junit.runner.JUnitCore  $1 $2 $3
}
