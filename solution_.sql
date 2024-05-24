USE bank;
#Challenge 1 - Who Have Published What At Where?
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    t.title, 
    p.pub_name
FROM 
    authors AS a
JOIN 
    titleauthor AS ta ON a.au_id = ta.au_id
JOIN 
    titles AS t ON ta.title_id = t.title_id
JOIN 
    publishers AS p ON t.pub_id = p.pub_id;
    
#Challenge 2 - Who Have Published How Many At Where?
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    p.pub_name,
    COUNT(t.title) AS title_count
FROM 
    authors AS a
JOIN 
    titleauthor AS ta ON a.au_id = ta.au_id
JOIN 
    titles AS t ON ta.title_id = t.title_id
JOIN 
    publishers AS p ON t.pub_id = p.pub_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY 
    a.au_id DESC;
    
#Challenge 3 - Best Selling Authors
#Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    COUNT(t.title) AS title_count
FROM 
    authors AS a
JOIN 
    titleauthor AS ta ON a.au_id = ta.au_id
JOIN 
    titles AS t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    title_count DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT 
    a.au_id, 
    a.au_lname, 
    a.au_fname, 
    COALESCE(COUNT(t.title), 0) AS title_count
FROM 
    authors AS a
LEFT JOIN 
    titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN 
    titles AS t ON ta.title_id = t.title_id
GROUP BY 
    a.au_id, a.au_lname, a.au_fname
ORDER BY 
    title_count DESC;

