function ios --wraps='npm run ios -- --device=' --wraps='npm run ios -- --device="iPhone di Andrea"' --description 'alias ios=npm run ios -- --device="iPhone di Andrea"'
    npm run ios -- --device="iPhone di Andrea" $argv
end
