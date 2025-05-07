# php-nginx

## Objective
This project provides optimized Docker images to run PHP applications with the Nginx web server. It is based on [php-fpm-docker](https://github.com/fbraz3/php-fpm-docker) and [php-base-docker](https://github.com/fbraz3/php-base-docker), supporting multiple PHP versions and architectures.

## Tags
The images are available with the following tags:

- `fbraz3/php-nginx:8.4`
- `fbraz3/php-nginx:8.3`
- `fbraz3/php-nginx:8.2`
- `fbraz3/php-nginx:8.1`
- `fbraz3/php-nginx:8.0`
- `fbraz3/php-nginx:7.4`
- `fbraz3/php-nginx:7.3`
- `fbraz3/php-nginx:7.2`
- `fbraz3/php-nginx:7.1`
- `fbraz3/php-nginx:7.0`
- `fbraz3/php-nginx:5.6`

Multi-architecture images (`amd64` and `arm64`) are also available.

## Flavors
This project supports different `flavors` to meet specific needs:

- `Vanilla`: Standard image with PHP and Nginx.
- `Phalcon`: Includes support for the Phalcon framework.

## How to Use
To run a PHP application with Nginx, use the following command:

```bash
docker run --name my-app -v $(pwd):/app/public -p 80:80 -d fbraz3/php-nginx:8.4
```

Replace `8.4` with the desired PHP version.

### Testing the Image
You can test the image with the following command:

```bash
curl http://127.0.0.1/
```

Ensure the current directory contains an `index.php` or `index.html` file.

## Manage PHP Directives via Environment Variables
Refer to the [php-fpm-docker documentation](https://github.com/fbraz3/php-fpm-docker#manage-php-directives-via-environment-variables) to learn how to manage PHP directives using environment variables.

## Cronjobs
To configure `cronjobs`, see the corresponding section in the [php-fpm-docker documentation](https://github.com/fbraz3/php-fpm-docker#cronjobs).

## Sending Mails
To configure email sending, refer to the [php-base-docker documentation](https://github.com/fbraz3/php-base-docker#sending-mails).

## Contribution
Contributions are welcome! Feel free to open issues or submit pull requests to improve the project.

Please visit the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on how to contribute to this project.

#### Useful links
- [How to create a pull request](https://docs.github.com/pt/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
- [How to report an issue](https://docs.github.com/pt/issues/tracking-your-work-with-issues/creating-an-issue)

## Donation
I spend a lot of time and effort maintaining this project. If you find it useful, consider supporting me with a donation:
- [GitHub Sponsor](https://github.com/sponsors/fbraz3)
- [Patreon](https://www.patreon.com/fbraz3)

## License

This project is licensed under the [Apache License 2.0](LICENSE), so you can use it for personal and commercial projects. However, please note that the images are provided "as is" without any warranty or guarantee of any kind. Use them at your own risk.