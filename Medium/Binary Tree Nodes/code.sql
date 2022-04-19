select if(p is null, 
          concat(n, ' Root'), 
          if(n in (select p from BST), 
             concat(n, ' Inner'), 
             concat(n, ' Leaf')
            )
         )
from BST
order by n;
