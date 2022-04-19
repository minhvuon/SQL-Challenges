You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

![image](https://s3.amazonaws.com/hr-challenge-images/12888/1443818507-5095ab9853-1.png)

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

* Root: If node is root node.
* Leaf: If node is leaf node.
* Inner: If node is neither root nor leaf node.

**Sample Input**

![image](https://s3.amazonaws.com/hr-challenge-images/12888/1443818467-30644673f6-2.png)

**Sample Output**
```
1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf
```
**Explanation**

The Binary Tree below illustrates the sample:

![image](https://s3.amazonaws.com/hr-challenge-images/12888/1443773633-f9e6fd314e-simply_sql_bst.png)

### Explain code
```
select if(p is null, 
          concat(n, ' Root'), 
          if(n in (select p from BST), 
             concat(n, ' Inner'), 
             concat(n, ' Leaf')
            )
         )
from BST
order by n;
```
