SELECT * from 
---parent join child
customer JOIN customer_artist_int
ON
---parent.pk = child.fk -Ideal
customer.customerid = customer_artist_int.customerid
