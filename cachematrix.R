## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

        invert = NULL
        
        setmatrix = function(y) {
                x <<- y
                invert <<- NULL
        }
        
        getmatrix = function() x
        
        setinvertmatrix = function(inverse) invert <<- inverse
        
        getinvertmatrix = function() invert
        
        list(set=setmatrix, get=getmatrix, setinv=setinvertmatrix, getinv=getinvertmatrix)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
        
        invert = x$getinv()
        
        # if  inverse exists
        if (!is.null(invert)){
                
                return(invert)
        }
        
        # else  calculate the inverse of a matrix 
        get.data = x$get()
        invert = solve(get.data, ...)
        
        # set the value of the inverse in the cache
        x$setinv(invert)
        
        return(invert)
}
