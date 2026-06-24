function android --wraps='npm run android -- --active-arch-only' --description 'alias android=npm run android -- --active-arch-only'
    npm run android -- --active-arch-only $argv
end
