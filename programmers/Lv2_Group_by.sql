-- Solution1)
select sale1.USER_ID as USER_ID, sale1.PRODUCT_ID as PRODUCT_ID
from ONLINE_SALE sale1, ONLINE_SALE sale2
where 
sale1.USER_ID = sale2.USER_ID 
AND 
sale1.PRODUCT_ID = sale2.PRODUCT_ID
AND
sale1.ONLINE_SALE_ID != sale2.ONLINE_SALE_ID
GROUP BY sale1.USER_ID, sale1.PRODUCT_ID
ORDER BY sale1.USER_ID, sale1.PRODUCT_ID DESC

-- Solution2)
select USER_ID, PRODUCT_ID
from ONLINE_SALE
group by USER_ID, PRODUCT_ID
having count(*) >= 2
order by USER_ID, PRODUCT_ID DESC;