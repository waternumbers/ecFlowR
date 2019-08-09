## source the ecflowR functions
tmp <- sapply(list.files('/home/paul/Documents/suites/ecFlowR/ecFlowR',
                         pattern='*.R$',full.names=TRUE),
              source)

## set environment variables
Sys.setenv(ECF_PORT = %ECF_PORT%,
           ECF_NAME = "%ECF_NAME%",
           ECF_PASS = "%ECF_PASS%",
           ECF_TRYNO = %ECF_TRYNO%,
           ECF_RID = Sys.getpid())

## tell ecflow_server we have started
ecflow_init()

## get current time
curTime <- format(Sys.time(),tz='GMT')

## wait a few seconds
Sys.sleep(5)

## update the label
ecflow_label("lastRun",paste(curTime))
## update the lastSucess label
ecflow_label("lastSucess",paste(curTime))

## force an exit
## stop("nasty R error")

## exit nicely
ecflow_complete()


