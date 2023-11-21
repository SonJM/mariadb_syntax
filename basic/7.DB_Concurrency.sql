phantom read
- if read가 두 번 있는 A 트랜잭션에서 코드를 실행 중 두번째 read가 진행되기 전에 
 B 트랜잭션에서 값이 insert되면서 생기는 오류?

repeatable read
A 트랜잭션에서 read를 한다면 다른 트랜잭션에서 일어나는 값의 변화를 무시하고 내 갈 길 가겠다 라는 느낌
-> 마지막에 commit된 값 기준으로 변경이 된다는건가?
 	-> 라는 느낌보단 겉으론 두 트랜잭션 다 정상적으로 실행되지만 뒷단에서의 데이터에 문제가 발생

해결책 : 공유락 (shared lock)을 건다 = 내가 먼저 read를 했다면 다른 트랜잭션에서 update를 못하게 하는 것
	ex) select ... for share;
	배타락 = 내 트랜잭션이 시작했으면 다른 트랜잭션은 아무것도 하지마! 그냥! 가만히 있어! (성능 저하 문제)


- update가 이루어지는 곳에선 다 트랜잭션으로 묶어버리겠다?

-- DB 동시성 이슈
Dirty Read : 한 트랜잭션이 다른 트랜잭션이 수정 중인 데이터를 읽을 수 있는 문제
Non-Repeatable Read
Phantom Read : 한 트랜잭션이 같은 조회쿼리를 여러 번 실행했을 떄, 그 중간에 다른 트랜잭션에서 새로운 데이터를 추가/삭제하여 다르게 나타나는 문제


-- DB 격리 수준
serializable(트랜잭션 순차 실행)

repeatable read

read committed

read uncommitted

-- Locking
낙관적락 - 버전관리 (성능은 좋지만 유저 경험엔 좋지않다 = 똑같이 실행해도 누군가는 정상진행 누군가는 오류)
비관적락 - 공유락 / 배타적락 @lock
            -> 데드락(교착 상태) : 트랜잭션이 무한루프에 빠지는 느낌이다 (어지간해선 서비스를 설계할 때 역방향으로 설계하지말고 순방향으로 설계해라)
                                    MariaDB에서는 일정 시간이 지나면 트랜잭션을 자동으로 Rollback을 시킨다.
                                    (근데 만약 Rollback을 시키고 다시 실행이됐을때 똑같은 일이 또 발생한다면? -> Rollback이 된다는건 다시 실행이 되는게 아닌가? -> mariadb의 데드락 자동 rollback후 실행 과정에 대해서 알면 해결될 듯?)
                                    -> 애초에 실행 시간 자체의 단위 자체가 굉장히 낮기 때문에 겹치는 일이 자주 발생하지 않는다.


SELECT user.email, user.name, user.score
       FROM(
           SELECT email, MAX(score) as max_score
           FROM user
           GROUP BY email
       ) t1 INNER JOIN user ON t1.email = user.email AND t1.max_score = user.score;