#!/bin/bash
set -Eeuo pipefail

encode() {
		previous_letter=''
		count=0

		terminate() {
			echo ''
			echo "$previous_letter $count"
			previous_letter=''
			count=0
			exit 0
		}
		trap terminate 2 3 6 15

		while true; do
			IFS=\n read word
			for i in $(seq 1 ${#word})
			do
 				letter=${word:i-1:1}
 				if [[ $previous_letter != $letter ]]; then
 					if [[ $count != 0 ]]; then
	 					echo "$previous_letter $count"
	 				fi
	 				previous_letter=$letter
	 				count=1
 				else
 					((count++))
 				fi
			done
		done

}

echo 'Write a sentence and press ENTER'
echo 'Repeat the process and press Ctrl-C to terminate'
encode