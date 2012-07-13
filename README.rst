What is this?
=============

``Rdatasets`` is a collection of datasets that are distributed alongside the statistical software environment ``R`` and some of its add-on packages. The goal, here, is to make these data more broadly accessible for teaching and statistical software development. 
 
csv
===

The ``csv`` folder includes all the collected datasets in comma-separated value format. I saved any data I could find in objects of class ``data.frame``, ``matrix``, ``numeric``, and ``table``. 

html
====

The ``html`` folder includes copies of the ``R`` documentation files for each dataset in plain html format. These docs appear to be licensed under GPL.  

I am also (temporarily?) hosting the html files there for easy viewing: http://www.umich.edu/~varel/rdatasets/

Want more?
==========

Many ``R`` packages ship with associated datasets, but the script used here only downloads data from packages that are locally installed. If you spot interesting data in a package distributed on CRAN, let me know, and I may be able to add it. Filing a github issue is best for this.

How to download data yourself
=============================

Just run the ``Rdatasets.R`` script in ``R``. This will save all csv files automatically and will open the docs in Firefox (one tab per dataset). I used the ``SaveAll!`` Firefox extension to batch save all those html files. I'm sure there's a better/cleaner way to save the docs, but it's the easiest way I could think of in the 15 minutes I used to collect ``Rdatasets``.  
