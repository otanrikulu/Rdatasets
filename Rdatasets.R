# Destinations
path_html = 'html/'
path_csv = 'csv/'
path_index = 'index.csv'

# Get list of available datasets (This list will change depending on which
# packages the user has installed locally)
index = data(package=.packages(all.available = TRUE))$results[,c(1,3,4)]
index_out = NULL

# Load packages which store datasets 
packages = unique(index[,'Package'])
for (i in packages) {
        library(i, character.only=TRUE)
}

# Download data, save as CSV, and save documentation as html
for (i in 1:nrow(index)) {
    dataset = index[i,'Item']
    package = index[i, 'Package']
    # Download packages as CSV files
    d = try(eval(parse(text=dataset)), silent=TRUE)
    # Keep if data has matrix-looking structure
    valid_class = class(d) %in% c('data.frame', 'matrix', 'numeric', 'table')
    # Keep if no existing dataset shares the name
    dup = dataset %in% index_out[,'Item']
    if (valid_class & !dup) {
        cat("Processing data set: ", dataset, "\n")
        dest_csv = paste(path_csv, dataset, '.csv', sep='')
        dest_html = paste(path_html, dataset, '.html', sep='')
        # Save data as CSV
        write.csv(d, dest_csv, row.names=FALSE)
        # Save documentation as HTML
        help.ref = help(eval(dataset), package=eval(package))
        help.file = utils:::.getHelpFile(help.ref)
        tools::Rd2HTML(help.file, out=dest_html)
        # Add entry to index out
        index_out = rbind(index_out, index[i,])
    }
}

# Write index to file
write.csv(index_out, file=path_index, row.names=FALSE)


