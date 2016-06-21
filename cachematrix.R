## makeCacheMatrix and cacheSolve are a pair of functions that cache the inverse of a matrix.

## makeCacheMatrix function uses advantage of lexical scoping to create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
## stores the cached value, default as NULL
cache <- NULL
## create the matrix in the working environment
set <- function(y) {
x <<- y
cache <<- NULL
}
## get the value of the matrix
get <- function() x
## invert the matrix and store inverted matrix in cache
setinverse <- function(solve) cache <<- solve
## get the inverted matrix from cache
getinverse <- function() cache
## return the created functions to the working environment
list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}


## cacheSolve function computes the inverse of the "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated, then the cachesolve retrieves the inverse from the cache.
## If the inverted matrix does not exist in cache, it is created in the working environment and it's inverted value is stored in cache.

cacheSolve <- function(x, ...) {
## get the inverse of the matrix stored in cache
cache <- x$getinverse()
# return inverted matrix from cache if it exists, else create the matrix in working environment.
if(!is.null(cache)) {
message("getting cached data")
return(cache)
}
# create matrix if it does not exist
data <- x$get()
## set inverted matrix in cache
cache <- solve(data, ...)
x$setinverse(cache)
## Return a matrix that is the inverse of 'x'
cache	
}
