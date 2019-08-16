#' ecflow_suite definition
#'
#' @description Functions for building ecFlow suites
#'
#' @param name name of the suite, task, family or label
#' @param val desired value for \code{name} to take
#' @param par parameter to set
#' @param start start of cron period
#' @param end end of cron period
#' @param step step of cron
#' @param cond the condition for the trigger to occur
#' @param ... nested suite objects
#'
#' @details cron times should be provided as strings. Parameter values are escaped if they are character strings.
#'
#' @examples
#' ## defining a simple suite
#' tmp <- suite("ecFlowR_test",
#'              edit("ECF_MICRO","%"),
#'              edit("ECF_JOB_CMD","Rscript %ECF_JOB% > %ECF_JOBOUT% 2>&1"),
#'              edit("ECF_KILL_CMD","kill -15 %ECF_RID%"),
#'              edit("ECF_CHECK_CMD","ps --pid %ECF_RID% -f"),
#'              edit("ECF_NODE","%ECF_HOST%"),
#'              edit("ECF_STATUS_CMD","ps --pid %ECF_RID% -f > %ECF_JOB%.stat 2>&1"),
#'              edit("etste",2),
#'              task("shouldRun",
#'                   cron("00:00","23:59","00:01"),
#'                   label("lastRun"),
#'                   label("lastSucess")),
#'              task("shouldFail",
#'                   cron("00:00","23:59","00:01"),
#'                   label("lastRun"),
#'                   label("lastSucess")),
#'              task("catchFail",
#'                   cron("00:00","23:59","00:01"),
#'                   label("lastRun"),
#'                   label("lastSucess"))
#'              )
#' writeLines(tmp)
#'
#' @name ecflow_suite
NULL

join <- function(type,name,...){
    c(paste(type,name),
      unlist(sapply(list(...),function(x){paste("\t",x)}))
      )
}
escapeStr <- function(x){
    ifelse(is.character(x),paste0("'",x,"'"),x)
}

#' @name ecflow_suite
#' @export
suite <- function(name,...){
    c(join("suite",name,...),"endsuite")
}

#' @name ecflow_suite
#' @export
family <- function(name,...){
    c(join("family",name,...),"endfamily")
}

#' @name ecflow_suite
#' @export
task <- function(name,...){
    join("task",name,...)
}

#' @name ecflow_suite
#' @export
edit <- function(par,val){
    val <- escapeStr(val)
    paste("edit",par,val)
}

#' @name ecflow_suite
#' @export
cron <- function(start,end,step){
    paste("cron",start,end,step)
}

#' @name ecflow_suite
#' @export
label <- function(name,val="''"){
    paste("label",name,val)
}

#' @name ecflow_suite
#' @export
trigger <- function(cond="''"){
    paste("trigger",cond)
}

