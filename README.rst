What is this?
=============

``Rdatasets`` is a collection of 262 data sets that were originally distributed alongside the statistical software environment ``R`` and some of its add-on packages. The goal is to make these data more broadly accessible for teaching and statistical software development. 

What is included?
=================

* csv folder: 262 data sets in comma-separated values file format
* doc folder: ``R`` documentation files for each of these data sets. 
* Rdatasets.R: ``R`` script which downloads CSV copies and HTML docs for all data sets distributed in ``Base R`` and any locally installed add-on package
* datasets.html: A list of available data sets, with a short description and the name of the source ``R`` package. 

Online documentation
====================

You will find an index of data sets here: http://vincentarelbundock.github.com/Rdatasets/

Adding data
===========

Many ``R`` packages ship with associated data sets, but the script included here only downloads data from packages that are installed locally on the machine where it is run. If you spot interesting data in a package distributed on CRAN, let me know. I will try to install that package on my computer and I will re-run the download script to see if the data can be added to this repository. Requests should be filed on the Github issue tracker.  

License
=======

* The ``R`` documentation which I copied to the ``Rdatasets`` ``html`` folder is licensed under GPL. You will find a copy of the GPL in the ``license`` folder. 
* I made a good faith effort to determine the license under which the actual data (i.e. rows/columns of numbers) were distributed, but I was unable to find a definitive answer. My understanding is that these data sets are free to re-distribute. However, if you own the rights to data that are included here and you object to their inclusion in ``Rdatasets``, send me an email at varel@umich.edu. I will promptly remove the data in question and will make sure that all traces are erased from the git revision history. 




