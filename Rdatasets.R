library(R2HTML)

packages = dget('packages.R')
#install.packages(packages)

# Destinations
path_html = 'doc/'
path_csv = 'csv/'

# Get list of available datasets (This list will change depending on which
# packages the user has installed locally)
index = data(package=.packages(all.available = TRUE))$results[,c(1,3,4)]
index = data.frame(index, stringsAsFactors=FALSE)
index_out = NULL

# Load packages which store datasets 
packages = unique(index[,'Package'])
for (i in packages) {
        library(i, character.only=TRUE)
}

# Remove datasets with duplicated names
#dup = duplicated(tolower(index$Item))
dup = duplicated(index$Item)
index = index[!dup,]

for (i in 1:nrow(index)) {
	dataset = index$Item[i]
	package = index$Package[i]
	# Load data in new environment (very hackish) 
    e = new.env(hash = TRUE, parent = parent.frame(), size = 29L)
    cmd = paste('data(', dataset, ', envir=e)', sep='')
    eval(parse(text=cmd))
    d = e[[dataset]]
    if(class(d) %in% c('data.frame', 'matrix', 'numeric', 'table')){
        cat("Processing data set: ", dataset, "\n")
        dest_csv = paste(path_csv, dataset, '.csv', sep='')
        dest_html = paste(path_html, dataset, '.html', sep='')
        # Save data as CSV
        write.csv(d, dest_csv)
        # Save documentation as HTML
        help.ref = help(eval(dataset), package=eval(package))
        help.file = utils:::.getHelpFile(help.ref)
        tools::Rd2HTML(help.file, out=dest_html)
        # Add entry to index out
        index_out = rbind(index_out, index[i,]) 
    }
}

# Make data_index.html
make_link = function(dataset, folder){
    ext = ifelse(folder=='doc', '.html', '.csv')
    link = paste(folder, '/', dataset, ext, sep='')
    out = paste("<a href=", link, ">", folder, "</a>", sep='')
    return(out)
}
datasets = index_out[,'Item']
links_doc = sapply(datasets, make_link, 'doc')
links_csv = sapply(datasets, make_link, 'csv')
out = cbind(index_out, links_doc, links_csv)
row.names(out) = NULL
colnames(out) = c('R Package', 'Dataset', 'Description', 'Doc', 'CSV')

# HTML index (TODO: Gets rebuilt every time, so may throw away information if certain datasets disappear from the R package)
unlink('datasets.html')
HTML(out, file='datasets.html', row.names=FALSE)

# CSV index
out$Doc = paste('https://raw.github.com/vincentarelbundock/Rdatasets/master/doc/', 
                out$Dataset, '.html', sep='')
out$CSV = paste('https://raw.github.com/vincentarelbundock/Rdatasets/master/csv/', 
                out$Dataset, '.csv', sep='')
if(file.exists('datasets.csv')){
    out2 = read.csv('datasets.csv', col.names=colnames(out))
    out = unique(rbind(out, out2))
}
write.csv(out, file='datasets.csv', row.names=FALSE)




