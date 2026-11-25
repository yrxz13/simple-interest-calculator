#!/usr/bin/env bash
set -euo pipefail

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (%): " rate
read -r -p "Enter the time period in years: " years

number='^([0-9]+([.][0-9]+)?|[.][0-9]+)$'
if ! [[ $principal =~ $number && $rate =~ $number && $years =~ $number ]]; then
  printf 'Enter non-negative numbers for all three inputs.\n' >&2
  exit 1
fi

LC_ALL=C awk -v principal="$principal" -v rate="$rate" -v years="$years" \
  'BEGIN { printf "Simple interest: %.2f\n", principal * rate * years / 100 }'
