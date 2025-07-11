select  
h1b.Employer,h1b.Fiscal_Year,  SUM(h1b.Initial_Approvals)  + SUM(h1b.Continuing_Approvals) AS Approvals, 
SUM(h1b.Initial_Denials) + SUM(h1b.Continuing_Denials) AS Denials
from h1b LEFT JOIN (
    select  
       Employer, 
       Fiscal_Year, 
       SUM(Initial_Approvals)  + SUM(Continuing_Approvals) AS Approvals_2016, 
       SUM(Initial_Denials) + SUM(Continuing_Denials) AS Denials_2016
       from h1b
       where Fiscal_Year !='2019'and Employer LIKE 'AMAZON'
       group by Fiscal_Year

) h1b2 ON h1b.Employer = h1b2.Employer
where h1b.Fiscal_Year !='2019' and h1b.Employer LIKE 'AMAZON'
group by h1b.Fiscal_Year
;
