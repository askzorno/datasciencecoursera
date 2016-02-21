## This function allows you to cache the inverse of a matrix

## This function creates a list with functions to set a matrix, get
## a matrix, set the inverse of a funciton, and get the inverse of
## a function

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get, setsolve = setsolve, getsolve=getsolve)
}


## This function pulls the cached inverse, or if none exists, calculates
## the inverse.

cacheSolve <- function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    mat <- x$get()
    m <- solve(mat,...)
    x$setsolve(m)
    m
}
