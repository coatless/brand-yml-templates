# brand-yml-templates

This repository contains several [`_brand.yml` configuration files][byml] that provide **unofficial** implementations of various brand guidelines. The configurations can be used across various data science applications and websites to maintain consistent branding.

## Overview

The [`_brand.yml` file][byml] provides structured data for Stanford's:

- Official color palette
- Typography specifications
- Logo usage parameters
- Spacing and layout guidelines
- Brand assets references

We can use this configuration file to switch to another brand theme easily. For example, we can use this configuration file to apply Stanford's brand to a [Shiny Python app](https://github.com/stanford-brand-yml/py-shiny-branded-demo) using the [`shiny`][s4py] Python package or to a [Quarto document](https://github.com/stanford-brand-yml/quarto-branded-website) using the [`brand`][qbyml] YAML key.

## Available Brand Configurations

We have the following brand configurations available:

- [Institute for Mathematical and Statistical Innovation](institute-for-mathematical-and-statistical-innovation/)
- [Stanford University](stanford-university/)
- [University of Illinois Urbana-Champaign](university-of-illinois-urbana-champaign/)
- [University of Illinois Chicago](university-of-illinois-chicago/)
- [University of Chicago](university-of-chicago/)
- [ZS Associates](zs-associates/)

> [!IMPORTANT]
>
> The brand configurations are not official and are provided for demonstration purposes only. Please consult the respective brand's guidelines for the official brand configuration. These implementations are independent from Posit's `_brand.yml` standard.

## Usage

1. Copy the `_brand.yml` file and `logos/` folder into your project's root directory
2. Apply the `_brand.yml`:
   - Use [`brand_yml`](https://posit-dev.github.io/brand-yml/pkg/py/) Python package to load the configuration into Python
   - Use [`ui.Theme.from_brand()`](https://shiny.posit.co/py/api/core/ui.Theme.html#shiny.ui.Theme.from_brand) to apply the configuration to a Shiny Python for Shiny app
   - Use [`brand`][qbyml] YAML key in Quarto to apply the configuration to a Quarto document

> [!NOTE]
> 
> For logo images, you may need to download the images from the source and place them in the `logos/` directory next to the `_brand.yml` file.

## File Structure

The `_brand.yml` contains the following main sections:

- [`meta`](https://posit-dev.github.io/brand-yml/brand/meta.html): Metadata about the brand configuration
- [`color`](https://posit-dev.github.io/brand-yml/brand/color.html): Stanford's official color palette including Cardinal Red and secondary colors
- [`typography`](https://posit-dev.github.io/brand-yml/brand/typography.html): Font families, sizes, and weights for different content types
- [`logo`](https://posit-dev.github.io/brand-yml/brand/logo.html): Specifications for logo usage and minimum clear space
- [`defaults`](https://posit-dev.github.io/brand-yml/brand/defaults.html): Default values for various design elements

## Contributing

We welcome contributions to this repository. Please send a [pull request][repopr] with the `_brand.yml` file and `logos/` folder for your brand configuration. 

## License

The `_brand.yml` files are licensed under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).

Please consult the respective brand's guidelines for the logo usage. Including the logos in this repository does not imply any endorsement or affiliation with the respective brand. The logos are used for demonstration purposes only.

## Acknowledgements

- Quarto for the brand YAML feature
- Shiny for Python team for the brand theming feature


[s4py]: https://shiny.posit.co/py/
[byml]: https://posit-dev.github.io/brand-yml/
[qbyml]: https://quarto.org/docs/authoring/brand.html
[shinylive]: https://shiny.posit.co/py/docs/shinylive.html
[repopr]: https://github.com/coatless/brand-yml-templates/pulls/