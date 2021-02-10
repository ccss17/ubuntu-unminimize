# ProgrammerBase 실습 환경

이 도커 이미지는 GBC ProgrammerBase 실습 환경입니다.

기존 `Ubuntu` 도커 이미지는 쉘에 로그인하여 사용하지 않는다는 가정하에 제작된 이미지이기 때문에 리눅스를 연습하기에는 시스템이 과하게 다이어트되어 있습니다. 

따라서 리눅스를 수월하게 실습할 수 있도록 필요한 패키지를 설치하고 적절한 설정을 하여 [ProgrammerBase](https://ccss17.github.io/ProgrammerBase/readme/) 를 잘 실습할 수 있도록 만들었습니다. 

## 컨테이너 실행

```shell
$ docker run -it ccss17/ubuntu
```

로그인 아이디는 `ccsss` 이고 비밀번호는 `a` 입니다.