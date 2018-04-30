# auto-mining-xmr-stak-amd
It is a simple shell script which is auto mining xmr-stak-amd(Radeon GPUs) for Mac OS X, when power adapter connected and display sleep mode turned on.

기존의 xmr-stak-amd 채굴 프로그램을 사용하여 sub-program인 간단한 쉘스크립트를 사용한다.
본 쉘스크립트와 프로그램은 Mac OS X 기반에서 실행이 된다.
테스트는 Mac OS X 10.13.4 High Sierra, Macbook Pro 2017 15inch에서 수행됨.

일단 xmr-stak-amd을 사용자의 홈폴더에 옮겨준다.
기본적인 xmr-stak-amd의 configuration을 진행한다. (여기선 생략, 자세한 사항은 xmr-stak 홈페이지를 참조바람.)

기본적인 xmr-stak을 사용하는 채굴 구성이 완료가되면 display_mining.sh를 사용하면 Macbook의 배터리, 전원 어뎁터에 따라서 채굴을 진행을 컨트롤 할 수 있다.
또한 xmr-stak-amd는 CPU를 사용하여 채굴을 하는 것이 아닌 GPU를 사용하여 채굴을 진행하는 프로그램이다. 컴퓨터를 사용 중에는 그래픽 성능이 현저히 저하가 되어
컴퓨터를 제대로 사용할 수가 없다... 따라서 디스플레이가 Sleep Mode일 경우 (컴퓨터 프로세서 자체는 켜져있고), GPU로 채굴을 진행한다.
즉, 전원 어뎁터가 연결이 되어있고, 디스플레이가 Sleep Mode일 경우 GPU를 사용하여 채굴을 진행한다. 최대치의 채굴을 하기 위해서는 제가 올린 저장소 중에
auto-mining-xmr-stak-cpu와 함께 사용하길 바란다. 이것은 CPU의 채굴을 담당하는 쉘 스크립트이다.

display_mining.sh를 터미널에서 실행을 하면 3초마다 항상 전원 어뎁터의 연결 유무 그리고 디스플레이가 Sleep Mode인지를 항상 확인을 하며
전원 어뎁터가 연결되지 않았다면 채굴을 진행하지 않는다. 만약 전원 어뎁터가 연결이 되었고 디스플레이가 Sleep Mode로 들어갔다면 채굴을 진행한다.
채굴을 시작하는 함수는 xmr-stak-amd를 실행을 하며, 채굴을 종료할때는 killall을 불러서 xmr-stak-amd를 강제로 종료하는 구성으로 되어있다.
항상 전원 어뎁터와 디스플레이가 Sleep Mode인지를 확인하는 것은 매우 큰 오버헤드로써, 3초마다 한번씩 전원 어뎁터 유무를 확인한다.

**디스플레이가 Sleep Mode로 들어갔을 경우, Screen Saver를 되도록이면 사용하지마세요. System Preference에서 Energy Saver에서 Display를
언제 Sleep할 것인지 시간만 설정하고 Screen Saver는 없음으로 설정해주세요~!!

궁금한 사항은 eonse32@gmail.com 메일을 부탁드립니다.
