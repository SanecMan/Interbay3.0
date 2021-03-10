#! /bin/bash 

cd "$(dirname "${BASH_SOURCE[0]}")"
cd ../

fail=0

for k in maps/*; do
	map=${k#maps/}
	if [[ -e maps/$map/$map.dm ]] && ! grep "MAP_PATH=$map" .travis.yml > /dev/null; then
		# $map is a valid map key, but travis isn't testing it!
		fail=$((fail + 1))
		echo "Ключ карты '$map' присутствует в репозитории, но не указан в .travis.yml!"
	fi
done

exit $fail
