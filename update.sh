[[ "$0" == "./update.sh" ]] || { echo "try './update.sh' "; exit; }
logdir=~/.logs/updates
mkdir -p   $logdir
function log {
    logfile=$logdir/$( date "+%Y-%m-%d-T-%H-%M-%S" )
    echo "=========================================================" >> $logfile
    echo $logfile                           >> $logfile
    echo "---------------------------------------------------------" >> $logfile
    git log -n1                             >> $logfile
    echo "---------------------------------------------------------" >> $logfile
    echo "$ $*"                             >> $logfile
    echo "=========================================================" >> $logfile
    echo ""                                 >> $logfile
    #echo "#########################################################" >> $logfile
    $*                     >> $logfile
    echo                                    >> $logfile
    cat $logfile
}
for script in $(ls [0-9]*.sh|sort); do
    target=$logdir/$script

    [[ -f $target ]] || {
        echo \# $( date "+%Y-%m-%d-T-%H-%M-%S" ) >> $target
        echo \# $script >> $target
        echo "---------------------------------------------------------" >> $target
        git log -n1 >> $target
        echo "---------------------------------------------------------" >> $target
        cat $script >> $target
        echo "---------------------------------------------------------" >> $target
        . $script >> $target
        echo
        cat $target
        read
    }
done
