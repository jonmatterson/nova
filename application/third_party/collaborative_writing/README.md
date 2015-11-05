# Nova Collaborative Writing Module

This module enhances Nova's mission post writing functionality so that more than one collaborator can work on a mission post at the same time. As collaborators edit the post, their changes will be reflected in real time to all other collaborators. It also includes a chat window so that collaborators can discuss the mission post as they work on it.

This module leverages [Etherpad Lite](http://etherpad.org/) under the hood. In order to use this module, you must have an instance of Etherpad Lite running. Etherpad Lite is compatible with any server that allows you to run Node.js applications.

## Installation

### Source Files

Pull down the source files of this module and place them in the directory `application/third_party/collaborative_writing`.

### Extend `posts_model.php`

In `application/models/posts_model.php`, add the following before the class definition:

```php
require_once APPPATH.'third_party/collaborative_writing/posts_model_traits.php';
```

And then add the following in the class definition:

```php
use Collaborative_Writing_Posts_Model_Trait;
```

If this is the only modification you've made to the `Write` controller, it will look like:

```php
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/models/nova_posts_model.php';
require_once APPPATH.'third_party/collaborative_writing/posts_model_traits.php';

class Posts_model extends Nova_posts_model {

	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * Put your own methods below this...
	 */
    
    use Collaborative_Writing_Posts_Model_Trait;
}
```

### Extend `write.php`

In `application/controllers/write.php`, add the following before the class definition:

```php
require_once APPPATH.'third_party/collaborative_writing/write_controller_missionpost_method_trait.php';
```

And add the following in the class definition:

```php
use Collaborative_Writing_Write_Controller_Missionpost_Method_Trait;
```

If this is the only modification you've made to the `Write` controller, it will look like:

```php
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/controllers/nova_write.php';
require_once APPPATH.'third_party/collaborative_writing/write_controller_missionpost_method_trait.php';

class Write extends Nova_write {

	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * Put your own methods below this...
	 */
    
    use Collaborative_Writing_Write_Controller_Missionpost_Method_Trait;
    
}
```

### Override `write_missionpost_js.php`

Create `application/views/_base_override/admin/js/write_missionpost_js.php` with the following code:

```php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require APPPATH.'third_party/collaborative_writing/write_missionpost_js.php';
```

### Configuration

Add `application/config/collaborative_writing.php` such as:

```php
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['collaborative_writing_etherpad_url'] = 'http://xxxxxxxxx:xxxx';
$config['collaborative_writing_etherpad_api_key'] = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
```

Replace the `xxxxx...` values with the actual URL, port and API key where Etherpad Lite is running. The API key for Etherpad Lite, if you're running it yourself, can be found once you start Etherpad in a file `APIKEY.txt` that it creates during first launch.

If you are not already running Etherpad Lite, before doing this, see **Installation (Etherpad Lite)** below.

### Database

Execute the following query to add the required table:

```
CREATE TABLE IF NOT EXISTS `posts_pad` (
  `ppad_id` varchar(40) NOT NULL,
  `ppad_post` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

## Installation (Etherpad Lite)

The Nova module leverages an instance Etherpad Lite. Etherpad Lite is a separate application that must also be installed. Full documentation can be found in the [README](https://github.com/ether/etherpad-lite/blob/develop/README.md), but this section attempts to give you the shortest-path-to-launch it can.

### Install Node.js

Install [Node.js](https://nodejs.org) if it is not already available on your machine.

### Download Etherpad Lite

The latest version of Etherpad Lite is available here:

http://etherpad.org/#download

### Configure Settings

It is recommended that you make the following changes to your settings:

* Comment out the dirty `dbType` and `dbSettings` below it by surrounding it with `/*` and `*/`, and then uncomment the MySQL `dbType` and `dbSettings` below it by removing the `/*` and `*/` surrounding it. Additionally, edit the `dbSettings` to correspond to your MySQL connection details and an empty MySQL database where it can initialize the necessary tables.
* Set `editOnly` to `true`.

### Run Etherpad Lite

To run Etherpad Lite, issue the following command:

```
bin/run.sh
```

Because this needs to run perpetually on a server, you can run it in background mode like:

```
bin/run.sh &
```

Make sure to create a cron script (or even better, run it as a service) to ensure that, if the run crashes, it is automatically restarted.

## Notices

### Tested on Nova 2.4.4

However, based on the design approach, it should be compatible with most versions of Nova 2 with no additional work.

### When Etherpad Lite Crashes

In order for this module to work fully, Etherpad Lite needs to be running; however, as all software crashes from time to time, this module fails gracefully when Etherpad Lite may not be available. If the Etherpad Lite instance isn't available when a user tries to edit the mission post, it will fall back to the standard mission post page instead.

### Compatibility with PHP < 5.4

If you are using PHP < 5.4, you should update; however, if you are on a shared hosting plan, you may not have that opportunity. If this is the case, the installation instructions above will not work right for you, and you instead need to do some additional manual work.

For both `application/models/posts_model.php` and `application/controllers/write.php`:

1. Remove the `require_once` line you added for `collaborative_writing/...`.
2. Remove the `use` line for `Collaborative_Writing_..._Trait`.
3. Go to the actual file formerly in the `require_once` and copy all of the code inside of `trait { ... }` directly into where the `use` line had been.

## Credits

The Collaborative Writing modification relies directly upon:

* Etherpad Lite - http://etherpad.org
* Etherpad Lite jQuery Plugin - https://github.com/ether/etherpad-lite-jquery-plugin
* Etherpad Lite PHP Client - https://github.com/TomNomNom/etherpad-lite-client
* Nova 2 - http://anodyne-productions.com/nova

A sincere thanks is extended to the authors of all these fine tools and all others that it implicitly leverages under the hood.

## License

The Collaborative Writing modification for Nova 2 is licensed under the BSD-3 clause license. The full text of the license may be found in the LICENSE file.
