SELECT temp.hacker_id, temp.name, SUM(temp.max_score) AS total_score
FROM 
(
    SELECT h1.hacker_id, h1.name,  MAX(s1.score) AS max_score FROM 
    Hackers h1 JOIN Submissions s1 
    ON h1.hacker_id = s1.hacker_id
    GROUP BY h1.hacker_id, h1.name, s1.challenge_id
) AS temp
GROUP BY temp.hacker_id, temp.name
HAVING total_score > 0
ORDER BY total_score DESC, temp.hacker_id;
