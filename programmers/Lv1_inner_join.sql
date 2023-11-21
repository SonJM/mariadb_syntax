-- 문제 오류 개 짜증난다 ㄹㅇ;;
SELECT 
    board.TITLE, 
    board.BOARD_ID, 
    reply.REPLY_ID, 
    reply.WRITER_ID, 
    reply.CONTENTS, 
    DATE_FORMAT(reply.CREATED_DATE,'%Y-%m-%d') AS CREATED_DATE
FROM 
    USED_GOODS_REPLY reply
INNER JOIN 
    USED_GOODS_BOARD board
ON 
    reply.BOARD_ID = board.BOARD_ID
WHERE
    DATE_FORMAT(board.CREATED_DATE, '%Y-%m') = '2022-10'
ORDER BY 
    reply.CREATED_DATE, TITLE;