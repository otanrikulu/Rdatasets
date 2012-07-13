rm(list=ls())
options(browser='firefox')

# Get list of available datasets (This list will change depending on which
# packages the user has installed locally)
index = data(package=.packages(all.available = TRUE))$results[,c(1,3,4)]
write.csv(index, file='index.csv', row.names=FALSE)

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
    d = try(eval(parse(text=dataset)))
    # Keep only if data has matrix-looking structure
    if(class(d) %in% c('data.frame', 'matrix', 'numeric', 'table')) {
        write.csv(d, paste('csv/', dataset, '.csv', sep=''), row.names=FALSE)
        # Open R documentation in Firefox
        url = paste('http://127.0.0.1:', tools:::httpdPort, '/library/', 
                    package, '/html/', dataset, '.html', sep='')
        browseURL(url)
    }
}

