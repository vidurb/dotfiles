function __fish_console_no_subcommand
    for i in (commandline -opc)
        if contains -- $i about help list api:graphql:export api:json-schema:generate api:openapi:export assets:install baldinof:roadrunner:worker cache:clear cache:pool:clear cache:pool:delete cache:pool:list cache:pool:prune cache:warmup config:dump-reference debug:autowiring debug:config debug:container debug:event-dispatcher debug:router debug:twig doctrine:cache:clear-collection-region doctrine:cache:clear-entity-region doctrine:cache:clear-metadata doctrine:cache:clear-query doctrine:cache:clear-query-region doctrine:cache:clear-result doctrine:database:create doctrine:database:drop doctrine:database:import doctrine:ensure-production-settings doctrine:mapping:convert doctrine:mapping:import doctrine:mapping:info doctrine:query:dql doctrine:query:sql doctrine:schema:create doctrine:schema:drop doctrine:schema:update doctrine:schema:validate fos:js-routing:debug fos:js-routing:dump lint:container lint:twig lint:yaml make:auth make:command make:controller make:crud make:docker:database make:entity make:fixtures make:form make:functional-test make:message make:messenger-middleware make:migration make:registration-form make:reset-password make:serializer:encoder make:serializer:normalizer make:subscriber make:twig-extension make:unit-test make:user make:validator make:voter router:match secrets:decrypt-to-local secrets:encrypt-from-local secrets:generate-keys secrets:list secrets:remove secrets:set security:encode-password
            return 1
        end
    end
    return 0
end

# global options
complete -c console -n '__fish_console_no_subcommand' -l help -d 'Display this help message'
complete -c console -n '__fish_console_no_subcommand' -l quiet -d 'Do not output any message'
complete -c console -n '__fish_console_no_subcommand' -l verbose -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug'
complete -c console -n '__fish_console_no_subcommand' -l version -d 'Display this application version'
complete -c console -n '__fish_console_no_subcommand' -l ansi -d 'Force ANSI output'
complete -c console -n '__fish_console_no_subcommand' -l no-ansi -d 'Disable ANSI output'
complete -c console -n '__fish_console_no_subcommand' -l no-interaction -d 'Do not ask any interactive question'
complete -c console -n '__fish_console_no_subcommand' -l env -d 'The Environment name.'
complete -c console -n '__fish_console_no_subcommand' -l no-debug -d 'Switches off debug mode.'

# commands
complete -c console -f -n '__fish_console_no_subcommand' -a about -d 'Displays information about the current project'
complete -c console -f -n '__fish_console_no_subcommand' -a help -d 'Displays help for a command'
complete -c console -f -n '__fish_console_no_subcommand' -a list -d 'Lists commands'
complete -c console -f -n '__fish_console_no_subcommand' -a api:graphql:export -d 'Export the GraphQL schema in Schema Definition Language (SDL)'
complete -c console -f -n '__fish_console_no_subcommand' -a api:json-schema:generate -d 'Generates the JSON Schema for a resource operation.'
complete -c console -f -n '__fish_console_no_subcommand' -a api:openapi:export -d 'Dump the OpenAPI documentation'
complete -c console -f -n '__fish_console_no_subcommand' -a assets:install -d 'Installs bundles web assets under a public directory'
complete -c console -f -n '__fish_console_no_subcommand' -a baldinof:roadrunner:worker -d 'Run the roadrunner worker'
complete -c console -f -n '__fish_console_no_subcommand' -a cache:clear -d 'Clears the cache'
complete -c console -f -n '__fish_console_no_subcommand' -a cache:pool:clear -d 'Clears cache pools'
complete -c console -f -n '__fish_console_no_subcommand' -a cache:pool:delete -d 'Deletes an item from a cache pool'
complete -c console -f -n '__fish_console_no_subcommand' -a cache:pool:list -d 'List available cache pools'
complete -c console -f -n '__fish_console_no_subcommand' -a cache:pool:prune -d 'Prunes cache pools'
complete -c console -f -n '__fish_console_no_subcommand' -a cache:warmup -d 'Warms up an empty cache'
complete -c console -f -n '__fish_console_no_subcommand' -a config:dump-reference -d 'Dumps the default configuration for an extension'
complete -c console -f -n '__fish_console_no_subcommand' -a debug:autowiring -d 'Lists classes/interfaces you can use for autowiring'
complete -c console -f -n '__fish_console_no_subcommand' -a debug:config -d 'Dumps the current configuration for an extension'
complete -c console -f -n '__fish_console_no_subcommand' -a debug:container -d 'Displays current services for an application'
complete -c console -f -n '__fish_console_no_subcommand' -a debug:event-dispatcher -d 'Displays configured listeners for an application'
complete -c console -f -n '__fish_console_no_subcommand' -a debug:router -d 'Displays current routes for an application'
complete -c console -f -n '__fish_console_no_subcommand' -a debug:twig -d 'Shows a list of twig functions, filters, globals and tests'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:cache:clear-collection-region -d 'Clear a second-level cache collection region'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:cache:clear-entity-region -d 'Clear a second-level cache entity region'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:cache:clear-metadata -d 'Clears all metadata cache for an entity manager'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:cache:clear-query -d 'Clears all query cache for an entity manager'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:cache:clear-query-region -d 'Clear a second-level cache query region'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:cache:clear-result -d 'Clears result cache for an entity manager'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:database:create -d 'Creates the configured database'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:database:drop -d 'Drops the configured database'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:database:import -d 'Import SQL file(s) directly to Database.'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:ensure-production-settings -d 'Verify that Doctrine is properly configured for a production environment'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:mapping:convert -d 'Convert mapping information between supported formats'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:mapping:import -d 'Imports mapping information from an existing database'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:mapping:info -d ''
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:query:dql -d 'Executes arbitrary DQL directly from the command line'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:query:sql -d 'Executes arbitrary SQL directly from the command line.'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:schema:create -d 'Executes (or dumps) the SQL needed to generate the database schema'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:schema:drop -d 'Executes (or dumps) the SQL needed to drop the current database schema'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:schema:update -d 'Executes (or dumps) the SQL needed to update the database schema to match the current mapping metadata'
complete -c console -f -n '__fish_console_no_subcommand' -a doctrine:schema:validate -d 'Validate the mapping files'
complete -c console -f -n '__fish_console_no_subcommand' -a fos:js-routing:debug -d 'Displays currently exposed routes for an application'
complete -c console -f -n '__fish_console_no_subcommand' -a fos:js-routing:dump -d 'Dumps exposed routes to the filesystem'
complete -c console -f -n '__fish_console_no_subcommand' -a lint:container -d 'Ensures that arguments injected into services match type declarations'
complete -c console -f -n '__fish_console_no_subcommand' -a lint:twig -d 'Lints a template and outputs encountered errors'
complete -c console -f -n '__fish_console_no_subcommand' -a lint:yaml -d 'Lints a file and outputs encountered errors'
complete -c console -f -n '__fish_console_no_subcommand' -a make:auth -d 'Creates a Guard authenticator of different flavors'
complete -c console -f -n '__fish_console_no_subcommand' -a make:command -d 'Creates a new console command class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:controller -d 'Creates a new controller class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:crud -d 'Creates CRUD for Doctrine entity class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:docker:database -d 'Adds a database container to your docker-compose.yaml file.'
complete -c console -f -n '__fish_console_no_subcommand' -a make:entity -d 'Creates or updates a Doctrine entity class, and optionally an API Platform resource'
complete -c console -f -n '__fish_console_no_subcommand' -a make:fixtures -d 'Creates a new class to load Doctrine fixtures'
complete -c console -f -n '__fish_console_no_subcommand' -a make:form -d 'Creates a new form class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:functional-test -d 'Creates a new functional test class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:message -d 'Creates a new message and handler'
complete -c console -f -n '__fish_console_no_subcommand' -a make:messenger-middleware -d 'Creates a new messenger middleware'
complete -c console -f -n '__fish_console_no_subcommand' -a make:migration -d 'Creates a new migration based on database changes'
complete -c console -f -n '__fish_console_no_subcommand' -a make:registration-form -d 'Creates a new registration form system'
complete -c console -f -n '__fish_console_no_subcommand' -a make:reset-password -d 'Create controller, entity, and repositories for use with symfonycasts/reset-password-bundle.'
complete -c console -f -n '__fish_console_no_subcommand' -a make:serializer:encoder -d 'Creates a new serializer encoder class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:serializer:normalizer -d 'Creates a new serializer normalizer class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:subscriber -d 'Creates a new event subscriber class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:twig-extension -d 'Creates a new Twig extension class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:unit-test -d 'Creates a new unit test class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:user -d 'Creates a new security user class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:validator -d 'Creates a new validator and constraint class'
complete -c console -f -n '__fish_console_no_subcommand' -a make:voter -d 'Creates a new security voter class'
complete -c console -f -n '__fish_console_no_subcommand' -a router:match -d 'Helps debug routes by simulating a path info match'
complete -c console -f -n '__fish_console_no_subcommand' -a secrets:decrypt-to-local -d 'Decrypts all secrets and stores them in the local vault'
complete -c console -f -n '__fish_console_no_subcommand' -a secrets:encrypt-from-local -d 'Encrypts all local secrets to the vault'
complete -c console -f -n '__fish_console_no_subcommand' -a secrets:generate-keys -d 'Generates new encryption keys'
complete -c console -f -n '__fish_console_no_subcommand' -a secrets:list -d 'Lists all secrets'
complete -c console -f -n '__fish_console_no_subcommand' -a secrets:remove -d 'Removes a secret from the vault'
complete -c console -f -n '__fish_console_no_subcommand' -a secrets:set -d 'Sets a secret in the vault'
complete -c console -f -n '__fish_console_no_subcommand' -a security:encode-password -d 'Encodes a password'

# command options

# about

# help
complete -c console -A -n '__fish_seen_subcommand_from help' -l format -d 'The output format (txt, xml, json, or md)'
complete -c console -A -n '__fish_seen_subcommand_from help' -l raw -d 'To output raw command help'

# list
complete -c console -A -n '__fish_seen_subcommand_from list' -l raw -d 'To output raw command list'
complete -c console -A -n '__fish_seen_subcommand_from list' -l format -d 'The output format (txt, xml, json, or md)'

# api:graphql:export
complete -c console -A -n '__fish_seen_subcommand_from api:graphql:export' -l comment-descriptions -d 'Use preceding comments as the description'
complete -c console -A -n '__fish_seen_subcommand_from api:graphql:export' -l output -d 'Write output to file'

# api:json-schema:generate
complete -c console -A -n '__fish_seen_subcommand_from api:json-schema:generate' -l itemOperation -d 'The item operation'
complete -c console -A -n '__fish_seen_subcommand_from api:json-schema:generate' -l collectionOperation -d 'The collection operation'
complete -c console -A -n '__fish_seen_subcommand_from api:json-schema:generate' -l format -d 'The response format'
complete -c console -A -n '__fish_seen_subcommand_from api:json-schema:generate' -l type -d 'The type of schema to generate (input or output)'

# api:openapi:export
complete -c console -A -n '__fish_seen_subcommand_from api:openapi:export' -l yaml -d 'Dump the documentation in YAML'
complete -c console -A -n '__fish_seen_subcommand_from api:openapi:export' -l spec-version -d 'OpenAPI version to use (3)'
complete -c console -A -n '__fish_seen_subcommand_from api:openapi:export' -l output -d 'Write output to file'
complete -c console -A -n '__fish_seen_subcommand_from api:openapi:export' -l api-gateway -d 'API Gateway compatibility'

# assets:install
complete -c console -A -n '__fish_seen_subcommand_from assets:install' -l symlink -d 'Symlinks the assets instead of copying it'
complete -c console -A -n '__fish_seen_subcommand_from assets:install' -l relative -d 'Make relative symlinks'
complete -c console -A -n '__fish_seen_subcommand_from assets:install' -l no-cleanup -d 'Do not remove the assets of the bundles that no longer exist'

# baldinof:roadrunner:worker

# cache:clear
complete -c console -A -n '__fish_seen_subcommand_from cache:clear' -l no-warmup -d 'Do not warm up the cache'
complete -c console -A -n '__fish_seen_subcommand_from cache:clear' -l no-optional-warmers -d 'Skip optional cache warmers (faster)'

# cache:pool:clear

# cache:pool:delete

# cache:pool:list

# cache:pool:prune

# cache:warmup
complete -c console -A -n '__fish_seen_subcommand_from cache:warmup' -l no-optional-warmers -d 'Skip optional cache warmers (faster)'

# config:dump-reference
complete -c console -A -n '__fish_seen_subcommand_from config:dump-reference' -l format -d 'The output format (yaml or xml)'

# debug:autowiring
complete -c console -A -n '__fish_seen_subcommand_from debug:autowiring' -l all -d 'Show also services that are not aliased'

# debug:config

# debug:container
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l show-arguments -d 'Used to show arguments in services'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l show-hidden -d 'Used to show hidden (internal) services'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l tag -d 'Shows all services with a specific tag'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l tags -d 'Displays tagged services for an application'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l parameter -d 'Displays a specific parameter for an application'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l parameters -d 'Displays parameters for an application'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l types -d 'Displays types (classes/interfaces) available in the container'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l env-var -d 'Displays a specific environment variable used in the container'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l env-vars -d 'Displays environment variables used in the container'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l format -d 'The output format (txt, xml, json, or md)'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l raw -d 'To output raw description'
complete -c console -A -n '__fish_seen_subcommand_from debug:container' -l deprecations -d 'Displays deprecations generated when compiling and warming up the container'

# debug:event-dispatcher
complete -c console -A -n '__fish_seen_subcommand_from debug:event-dispatcher' -l format -d 'The output format  (txt, xml, json, or md)'
complete -c console -A -n '__fish_seen_subcommand_from debug:event-dispatcher' -l raw -d 'To output raw description'

# debug:router
complete -c console -A -n '__fish_seen_subcommand_from debug:router' -l show-controllers -d 'Show assigned controllers in overview'
complete -c console -A -n '__fish_seen_subcommand_from debug:router' -l format -d 'The output format (txt, xml, json, or md)'
complete -c console -A -n '__fish_seen_subcommand_from debug:router' -l raw -d 'To output raw route(s)'

# debug:twig
complete -c console -A -n '__fish_seen_subcommand_from debug:twig' -l filter -d 'Show details for all entries matching this filter'
complete -c console -A -n '__fish_seen_subcommand_from debug:twig' -l format -d 'The output format (text or json)'

# doctrine:cache:clear-collection-region
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-collection-region' -l all -d 'If defined, all entity regions will be deleted/invalidated.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-collection-region' -l flush -d 'If defined, all cache entries will be flushed.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-collection-region' -l em -d 'The entity manager to use for this command'

# doctrine:cache:clear-entity-region
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-entity-region' -l all -d 'If defined, all entity regions will be deleted/invalidated.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-entity-region' -l flush -d 'If defined, all cache entries will be flushed.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-entity-region' -l em -d 'The entity manager to use for this command'

# doctrine:cache:clear-metadata
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-metadata' -l flush -d 'If defined, cache entries will be flushed instead of deleted/invalidated.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-metadata' -l em -d 'The entity manager to use for this command'

# doctrine:cache:clear-query
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-query' -l flush -d 'If defined, cache entries will be flushed instead of deleted/invalidated.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-query' -l em -d 'The entity manager to use for this command'

# doctrine:cache:clear-query-region
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-query-region' -l all -d 'If defined, all query regions will be deleted/invalidated.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-query-region' -l flush -d 'If defined, all cache entries will be flushed.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-query-region' -l em -d 'The entity manager to use for this command'

# doctrine:cache:clear-result
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-result' -l flush -d 'If defined, cache entries will be flushed instead of deleted/invalidated.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:cache:clear-result' -l em -d 'The entity manager to use for this command'

# doctrine:database:create
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:create' -l shard -d 'The shard connection to use for this command'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:create' -l connection -d 'The connection to use for this command'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:create' -l if-not-exists -d 'Don\'t trigger an error, when the database already exists'

# doctrine:database:drop
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:drop' -l shard -d 'The shard connection to use for this command'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:drop' -l connection -d 'The connection to use for this command'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:drop' -l if-exists -d 'Don\'t trigger an error, when the database doesn\'t exist'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:drop' -l force -d 'Set this parameter to execute this action'

# doctrine:database:import
complete -c console -A -n '__fish_seen_subcommand_from doctrine:database:import' -l connection -d 'The connection to use for this command'

# doctrine:ensure-production-settings
complete -c console -A -n '__fish_seen_subcommand_from doctrine:ensure-production-settings' -l complete -d 'Flag to also inspect database connection existence.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:ensure-production-settings' -l em -d 'The entity manager to use for this command'

# doctrine:mapping:convert
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:convert' -l filter -d 'A string pattern used to match entities that should be processed.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:convert' -l force -d 'Force to overwrite existing mapping files.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:convert' -l from-database -d 'Whether or not to convert mapping information from existing database.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:convert' -l extend -d 'Defines a base class to be extended by generated entity classes.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:convert' -l num-spaces -d 'Defines the number of indentation spaces'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:convert' -l namespace -d 'Defines a namespace for the generated entity classes, if converted from database.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:convert' -l em -d 'The entity manager to use for this command'

# doctrine:mapping:import
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:import' -l em -d 'The entity manager to use for this command'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:import' -l shard -d 'The shard connection to use for this command'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:import' -l filter -d 'A string pattern used to match entities that should be mapped.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:import' -l force -d 'Force to overwrite existing mapping files.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:import' -l path -d 'The path where the files would be generated (not used when a bundle is passed).'

# doctrine:mapping:info
complete -c console -A -n '__fish_seen_subcommand_from doctrine:mapping:info' -l em -d 'The entity manager to use for this command'

# doctrine:query:dql
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:dql' -l hydrate -d 'Hydration mode of result set. Should be either: object, array, scalar or single-scalar.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:dql' -l first-result -d 'The first result in the result set.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:dql' -l max-result -d 'The maximum number of results in the result set.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:dql' -l depth -d 'Dumping depth of Entity graph.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:dql' -l show-sql -d 'Dump generated SQL instead of executing query'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:dql' -l em -d 'The entity manager to use for this command'

# doctrine:query:sql
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:sql' -l depth -d 'Dumping depth of result set.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:sql' -l force-fetch -d 'Forces fetching the result.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:query:sql' -l connection -d 'The connection to use for this command'

# doctrine:schema:create
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:create' -l dump-sql -d 'Instead of trying to apply generated SQLs into EntityManager Storage Connection, output them.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:create' -l em -d 'The entity manager to use for this command'

# doctrine:schema:drop
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:drop' -l dump-sql -d 'Instead of trying to apply generated SQLs into EntityManager Storage Connection, output them.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:drop' -l force -d 'Don\'t ask for the deletion of the database, but force the operation to run.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:drop' -l full-database -d 'Instead of using the Class Metadata to detect the database table schema, drop ALL assets that the database contains.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:drop' -l em -d 'The entity manager to use for this command'

# doctrine:schema:update
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:update' -l complete -d 'If defined, all assets of the database which are not relevant to the current metadata will be dropped.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:update' -l dump-sql -d 'Dumps the generated SQL statements to the screen (does not execute them).'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:update' -l force -d 'Causes the generated SQL statements to be physically executed against your database.'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:update' -l em -d 'The entity manager to use for this command'

# doctrine:schema:validate
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:validate' -l skip-mapping -d 'Skip the mapping validation check'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:validate' -l skip-sync -d 'Skip checking if the mapping is in sync with the database'
complete -c console -A -n '__fish_seen_subcommand_from doctrine:schema:validate' -l em -d 'The entity manager to use for this command'

# fos:js-routing:debug
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:debug' -l show-controllers -d 'Show assigned controllers in overview'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:debug' -l format -d 'The output format (txt, xml, json, or md)'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:debug' -l raw -d 'To output raw route(s)'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:debug' -l domain -d 'Specify expose domain'

# fos:js-routing:dump
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:dump' -l callback -d 'Callback function to pass the routes as an argument.'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:dump' -l format -d 'Format to output routes in. js to wrap the response in a callback, json for raw json output. Callback is ignored when format is json'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:dump' -l target -d 'Override the target directory to dump routes in.'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:dump' -l locale -d 'Set locale to be used with JMSI18nRoutingBundle.'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:dump' -l pretty-print -d 'Pretty print the JSON.'
complete -c console -A -n '__fish_seen_subcommand_from fos:js-routing:dump' -l domain -d 'Specify expose domain'

# lint:container

# lint:twig
complete -c console -A -n '__fish_seen_subcommand_from lint:twig' -l format -d 'The output format'
complete -c console -A -n '__fish_seen_subcommand_from lint:twig' -l show-deprecations -d 'Show deprecations as errors'

# lint:yaml
complete -c console -A -n '__fish_seen_subcommand_from lint:yaml' -l format -d 'The output format'
complete -c console -A -n '__fish_seen_subcommand_from lint:yaml' -l parse-tags -d 'Parse custom tags'

# make:auth

# make:command

# make:controller
complete -c console -A -n '__fish_seen_subcommand_from make:controller' -l no-template -d 'Use this option to disable template generation'

# make:crud

# make:docker:database

# make:entity
complete -c console -A -n '__fish_seen_subcommand_from make:entity' -l api-resource -d 'Mark this class as an API Platform resource (expose a CRUD API for it)'
complete -c console -A -n '__fish_seen_subcommand_from make:entity' -l regenerate -d 'Instead of adding new fields, simply generate the methods (e.g. getter/setter) for existing fields'
complete -c console -A -n '__fish_seen_subcommand_from make:entity' -l overwrite -d 'Overwrite any existing getter/setter methods'

# make:fixtures

# make:form

# make:functional-test

# make:message

# make:messenger-middleware

# make:migration

# make:registration-form

# make:reset-password

# make:serializer:encoder

# make:serializer:normalizer

# make:subscriber

# make:twig-extension

# make:unit-test

# make:user
complete -c console -A -n '__fish_seen_subcommand_from make:user' -l is-entity -d 'Do you want to store user data in the database (via Doctrine)?'
complete -c console -A -n '__fish_seen_subcommand_from make:user' -l identity-property-name -d 'Enter a property name that will be the unique "display" name for the user (e.g. email, username, uuid)'
complete -c console -A -n '__fish_seen_subcommand_from make:user' -l with-password -d 'Will this app be responsible for checking the password? Choose No if the password is actually checked by some other system (e.g. a single sign-on server)'
complete -c console -A -n '__fish_seen_subcommand_from make:user' -l use-argon2 -d 'Use the Argon2i password encoder? (deprecated)'

# make:validator

# make:voter

# router:match
complete -c console -A -n '__fish_seen_subcommand_from router:match' -l method -d 'Sets the HTTP method'
complete -c console -A -n '__fish_seen_subcommand_from router:match' -l scheme -d 'Sets the URI scheme (usually http or https)'
complete -c console -A -n '__fish_seen_subcommand_from router:match' -l host -d 'Sets the URI host'

# secrets:decrypt-to-local
complete -c console -A -n '__fish_seen_subcommand_from secrets:decrypt-to-local' -l force -d 'Forces overriding of secrets that already exist in the local vault'

# secrets:encrypt-from-local

# secrets:generate-keys
complete -c console -A -n '__fish_seen_subcommand_from secrets:generate-keys' -l local -d 'Updates the local vault.'
complete -c console -A -n '__fish_seen_subcommand_from secrets:generate-keys' -l rotate -d 'Re-encrypts existing secrets with the newly generated keys.'

# secrets:list
complete -c console -A -n '__fish_seen_subcommand_from secrets:list' -l reveal -d 'Display decrypted values alongside names'

# secrets:remove
complete -c console -A -n '__fish_seen_subcommand_from secrets:remove' -l local -d 'Updates the local vault.'

# secrets:set
complete -c console -A -n '__fish_seen_subcommand_from secrets:set' -l local -d 'Updates the local vault.'
complete -c console -A -n '__fish_seen_subcommand_from secrets:set' -l random -d 'Generates a random value.'

# security:encode-password
complete -c console -A -n '__fish_seen_subcommand_from security:encode-password' -l empty-salt -d 'Do not generate a salt or let the encoder generate one.'
