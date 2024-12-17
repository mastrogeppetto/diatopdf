#!/bin/bash
set -e
if [[ $# -eq 0 ]] ; then
    echo 'Devi inserire il file dia da convertire. Usa: $0 <nome_file>'
    exit 0
fi
if [[ "$1" != *.dia ]]; then
    echo "Errore: il file non ha estensione .dia"
    exit 1
fi
if [ ! -e "$1" ]; then
    echo "Errore: il file '$1' non esiste."
    exit 1
fi
risultato=`basename $1 .dia`.pdf
if [ -e "$risultato" ]; then
    echo "Attenzione: il file '$risultato' esiste già."
    read -p "Vuoi rimuoverlo? [s/N]: " risposta
    case "$risposta" in
        [sS]|[sS][iI])
            rm "$risultato"
            echo "File '$risultato' rimosso con successo."
            ;;
        *)
            echo "Operazione annullata. Il file non è stato rimosso."
            exit 1
            ;;
    esac
fi
tempfile=$(mktemp)
echo $tempfile
dia --log-to-stderr --nosplash --filter=eps --export=$tempfile $1
epstopdf --outfile $risultato $tempfile
