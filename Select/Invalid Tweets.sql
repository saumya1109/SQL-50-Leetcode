# Write your MySQL query statement below


/*
Use CHAR_LENGTH when you are interested in the number of characters, regardless of their byte size.
Use LENGTH when you need to know the actual byte size of the string, which might be relevant for storage or transmission considerations.

Let's consider a string that contains multibyte characters:

SET @example = 'hello 你好';
In this string, 'hello ' consists of 6 ASCII characters (each 1 byte).

'你好' consists of 2 Chinese characters, which are 3 bytes each in UTF-8.


CHAR_LENGTH:
SELECT CHAR_LENGTH(@example);  -- Output: 8
This counts the number of characters in the string: 6 (for "hello ") + 2 (for "你好") = 8 characters.

LENGTH:
SELECT LENGTH(@example);  -- Output: 12
This counts the total number of bytes in the string: 6 (for "hello ") + 6 (for "你好", since each character is 3 bytes) = 12 bytes.

*/

select tweet_id from Tweets where length(content)>15;


select tweet_id from Tweets where char_length(content)>15;