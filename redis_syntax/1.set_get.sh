# 키-값 생성
SET [key] [value]
# 해당 key에 value가 없을 때만 대입(있을 시 (nil)반환)
SET [key] [value] NX
#  지정한 시간만큼만 값 저장
SET [key] [value] EX [seconds]

# key에 있는 값을 출력
GET [key]
# 저장되어 있는 모든 값 출력
keys *
# 저장되어 있는 모든 값 제거
FLUSHDB

# ----------------- LIST -------------------
# 데이터 추가
LPUSH [key] [member1] [member2] ...  
RPUSH [key] [member1] [member2] ...  
# 데이터 추출
LPOP [key], RPOP[key]
# 데이터 개수
LLEN [key]
# 데이터 조회, 만약 끝까지 조회하고 싶다면 end_num에 -1 입력
LRANGE [key] [start_num] [end_num]
# 만료시간 지정
EXPIRE [key] [seconds]
# 남은 시간 확인
TTL [key]

# ----------------- SET ------------------
# SET(집합)에 멤버 추가
SADD [key] [member]
# SET(집합)의 모든 멤버 반환
SMEMBERS [key]
# 특정 멤버 삭제
SREM [key] [member1] [member2] ...

# ----------------- ZSET ------------------
# 기본 문법
# score : 멤버를 정렬하는데 사용되는 정수값
#  member 형식을 json형식으로도 가능
ZADD [key] [score] [member]
# 특정 키의 특정멤버 삭제
ZREM [key] [member]
# 특정 멤버의 위치 정보 반환
ZRANK [key] [member]
# score 기준 오름차순 조회
ZRANGE [key] [start_num] [end_num]
# score 기준 내림차순 조회
ZREVRANGE [key] [start_num] [end_num]

# ++key (key의 value가 integer형식이여야함)
INCR [key]
# --key
DECR [key]