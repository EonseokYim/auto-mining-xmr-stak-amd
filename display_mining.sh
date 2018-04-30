#!/bin/bash
############################################################################
#함수들
############################################################################
cd ~/xmr-stak-amd/

power_checking() { #파워가 연결이 되면 1을 리턴, 아니면 0을 리턴
	local result=$(pmset -g batt | grep "AC Power") #맥의 배터리 상태를 문구 저장
	local comparsion=$(echo "Now drawing from 'AC Power'") #맥이 어뎁터연결되었을때 문구
	power=0
	if [ "$comparsion" == "$result" ]; then #두 문구가 동일하면 power에 1을 저장.
		power=1
	fi
}
display_checking() {
	display_status=$(ioreg -n IODisplayWrangler | grep -i IOPowerManagement | perl -pe 's/^.*DevicePowerState\"=([0-9]+).*$/\1/')
}
start_gpu_mining() {
	echo "Start GPU Mining @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >&2
	~/xmr-stak-amd/xmr-stak-amd
}
stop_gpu_mining() {
	echo "Terminate GPU Mining @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" >&2
	killall xmr-stak-amd
}
second_checking() {
	while true #무한 반복
	do
		display_status=$(ioreg -n IODisplayWrangler | grep -i IOPowerManagement | perl -pe 's/^.*DevicePowerState\"=([0-9]+).*$/\1/')
        result=$(pmset -g batt | grep "AC Power")
		if [ "$display_status" == "4" ]; then
			stop_gpu_mining #채굴 종료
			break #무한반복 빠져나옴
		fi
        if [ "$comparsion" != "$result" ]; then #같지 않으면
			stop_gpu_mining #채굴 종료
			break #무한반복 빠져나옴
		fi
		sleep 3 #오버헤드를 줄이기위해 3초 마다 확인함.
	done
}

############################################################################
#실제 메인함수
############################################################################
comparsion=$(echo "Now drawing from 'AC Power'")

while true
do
    display_checking
    power_checking
    if [ "$display_status" != "4" ]; then
        if [ $power -eq 1 ]; then #어뎁터가 연결되면
            second_checking|start_gpu_mining
        fi
    fi
    sleep 3
done
