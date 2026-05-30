{
  "metadata": {
    "language_info": {
      "name": "R",
      "codemirror_mode": "r",
      "pygments_lexer": "r",
      "mimetype": "text/x-r-source",
      "file_extension": ".r",
      "version": "3.6.3"
    },
    "kernelspec": {
      "name": "ir",
      "display_name": "R",
      "language": "R"
    },
    "colab": {
      "name": "EDA Online Retail ",
      "provenance": [],
      "include_colab_link": true
    }
  },
  "nbformat_minor": 0,
  "nbformat": 4,
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/hungpham9871/Project-Nho-m-/blob/main/1.2.3.b\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "source": [
        "\n",
        "# IMPORTANT: RUN THIS CELL IN ORDER TO IMPORT YOUR KAGGLE DATA SOURCES\n",
        "# TO THE CORRECT LOCATION (/kaggle/input) IN YOUR NOTEBOOK,\n",
        "# THEN FEEL FREE TO DELETE THIS CELL.\n",
        "# NOTE: THIS NOTEBOOK ENVIRONMENT DIFFERS FROM KAGGLE'S R\n",
        "# ENVIRONMENT SO THERE MAY BE MISSING LIBRARIES USED BY YOUR\n",
        "# NOTEBOOK.\n",
        "\n",
        "DATA_SOURCE_MAPPING = 'online-retail:https%3A%2F%2Fstorage.googleapis.com%2Fkaggle-data-sets%2F1283855%2F2139706%2Fbundle%2Farchive.zip%3FX-Goog-Algorithm%3DGOOG4-RSA-SHA256%26X-Goog-Credential%3Dgcp-kaggle-com%2540kaggle-161607.iam.gserviceaccount.com%252F20260530%252Fauto%252Fstorage%252Fgoog4_request%26X-Goog-Date%3D20260530T025343Z%26X-Goog-Expires%3D259200%26X-Goog-SignedHeaders%3Dhost%26X-Goog-Signature%3Db8840e91a1037c6c011063098b0ceb8c91b3d697eed91b4f80c1cf491f76a7d24c5ed237167e8c8242c16db4b9e46e1e9fd621c73c2b7a877d2d39f36765035ff3a071b5896fafb71bc9bdc1c874d3ebca7c279d7d12402187b0efada1e571d35079c549b01d018897187a58672d522a495e9abcd67b1d2b7f3856e1a09d00df1e3f5d688624418bf8d71e4cd369a742b519a145b2e9c1fa697eb7f2a84d61fd85b671582d1c5b155a2a0c802ff1586f156a2755d1db22a0aef312054170c441c4678f2ec1bd00e5375fb5194a35820ee46b332155d20b5c03c588c5b56d5659581a0b5b317ff551949db57a6c7290c180ca8104b30bf18374026b7aa7e94949'\n",
        "\n",
        "KAGGLE_INPUT_PATH = '/kaggle/input'\n",
        "KAGGLE_WORKING_PATH = '/kaggle/working'\n",
        "\n",
        "system(paste0('sudo umount ', '/kaggle/input'))\n",
        "system(paste0('sudo rmdir ', '/kaggle/input'))\n",
        "system(paste0('sudo mkdir -p -- ', KAGGLE_INPUT_PATH), intern=TRUE)\n",
        "system(paste0('sudo chmod 777 ', KAGGLE_INPUT_PATH), intern=TRUE)\n",
        "system(\n",
        "  paste0('sudo ln -sfn ', KAGGLE_INPUT_PATH,' ',file.path('..', 'input')),\n",
        "  intern=TRUE)\n",
        "\n",
        "system(paste0('sudo mkdir -p -- ', KAGGLE_WORKING_PATH), intern=TRUE)\n",
        "system(paste0('sudo chmod 777 ', KAGGLE_WORKING_PATH), intern=TRUE)\n",
        "system(\n",
        "  paste0('sudo ln -sfn ', KAGGLE_WORKING_PATH, ' ', file.path('..', 'working')),\n",
        "  intern=TRUE)\n",
        "\n",
        "data_source_mappings = strsplit(DATA_SOURCE_MAPPING, ',')[[1]]\n",
        "for (data_source_mapping in data_source_mappings) {\n",
        "    path_and_url = strsplit(data_source_mapping, ':')\n",
        "    directory = path_and_url[[1]][1]\n",
        "    download_url = URLdecode(path_and_url[[1]][2])\n",
        "    filename = sub(\"\\\\?.+\", \"\", download_url)\n",
        "    destination_path = file.path(KAGGLE_INPUT_PATH, directory)\n",
        "    print(paste0('Downloading and uncompressing: ', directory))\n",
        "    if (endsWith(filename, '.zip')){\n",
        "      temp = tempfile(fileext = '.zip')\n",
        "      download.file(download_url, temp)\n",
        "      unzip(temp, overwrite = TRUE, exdir = destination_path)\n",
        "      unlink(temp)\n",
        "    }\n",
        "    else{\n",
        "      temp = tempfile(fileext = '.tar')\n",
        "      download.file(download_url, temp)\n",
        "      untar(temp, exdir = destination_path)\n",
        "      unlink(temp)\n",
        "    }\n",
        "    print(paste0('Downloaded and uncompressed: ', directory))\n",
        "}\n",
        "\n",
        "print(paste0('Data source import complete'))\n"
      ],
      "metadata": {
        "id": "n87B_aMr0fkX",
        "outputId": "11dada5e-fe05-4e33-8066-c234ee282fea",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 69
        }
      },
      "cell_type": "code",
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "[1] \"Downloading and uncompressing: online-retail\"\n",
            "[1] \"Downloaded and uncompressed: online-retail\"\n",
            "[1] \"Data source import complete\"\n"
          ]
        }
      ],
      "execution_count": 10
    },
    {
      "cell_type": "code",
      "source": [
        "install.packages(\"ggplot2\")\n",
        "library(ggplot2)\n",
        "install.packages(\"readxl\")\n",
        "library(\"readxl\")\n",
        "library(magrittr)\n",
        "install.packages(\"dplyr\")\n",
        "library(dplyr)\n",
        "install.packages(\"reshape2\")\n",
        "library(reshape2)\n",
        "install.packages(\"plotly\")\n",
        "library(plotly)\n",
        "install.packages(\"tidyr\")\n",
        "library(\"tidyr\")"
      ],
      "metadata": {
        "_uuid": "c6201e76-7c51-450a-ad2f-467b9cf81e52",
        "_cell_guid": "64908f73-ccc3-4eda-abab-2ed4689b22ba",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "BAlmywPf0fka",
        "outputId": "42d05128-7218-4d9a-e8d5-4cc50d14bb94",
        "colab": {
          "base_uri": "https://localhost:8080/"
        }
      },
      "execution_count": 11,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n",
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n",
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n",
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n",
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n",
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "head(df,10)"
      ],
      "metadata": {
        "_uuid": "c01bc98c-715e-489a-8573-62d91bc98040",
        "_cell_guid": "1522cfa7-2b78-4bf5-b52f-cbf1394b22d4",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "QZIY4_pv0fkb",
        "outputId": "0d8ec55e-905c-4892-e9f9-f6d2ac7a1e6b",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 411
        }
      },
      "execution_count": 12,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 10 × 8</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>CustomerID</th><th scope=col>InvoiceNo</th><th scope=col>StockCode</th><th scope=col>Quantity</th><th scope=col>UnitPrice</th><th scope=col>Description</th><th scope=col>InvoiceDate</th><th scope=col>Country</th></tr>\n",
              "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>17850</td><td>536365</td><td>85123A</td><td> 6</td><td>2.55</td><td>WHITE HANGING HEART T-LIGHT HOLDER </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>71053 </td><td> 6</td><td>3.39</td><td>WHITE METAL LANTERN                </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84406B</td><td> 8</td><td>2.75</td><td>CREAM CUPID HEARTS COAT HANGER     </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029G</td><td> 6</td><td>3.39</td><td>KNITTED UNION FLAG HOT WATER BOTTLE</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029E</td><td> 6</td><td>3.39</td><td>RED WOOLLY HOTTIE WHITE HEART.     </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>22752 </td><td> 2</td><td>7.65</td><td>SET 7 BABUSHKA NESTING BOXES       </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>21730 </td><td> 6</td><td>4.25</td><td>GLASS STAR FROSTED T-LIGHT HOLDER  </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536366</td><td>22633 </td><td> 6</td><td>1.85</td><td>HAND WARMER UNION JACK             </td><td>2010-12-01 08:28:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536366</td><td>22632 </td><td> 6</td><td>1.85</td><td>HAND WARMER RED POLKA DOT          </td><td>2010-12-01 08:28:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>13047</td><td>536367</td><td>84879 </td><td>32</td><td>1.69</td><td>ASSORTED COLOUR BIRD ORNAMENT      </td><td>2010-12-01 08:34:00</td><td>United Kingdom</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 10 × 8\n\n| CustomerID &lt;dbl&gt; | InvoiceNo &lt;chr&gt; | StockCode &lt;chr&gt; | Quantity &lt;dbl&gt; | UnitPrice &lt;dbl&gt; | Description &lt;chr&gt; | InvoiceDate &lt;dttm&gt; | Country &lt;chr&gt; |\n|---|---|---|---|---|---|---|---|\n| 17850 | 536365 | 85123A |  6 | 2.55 | WHITE HANGING HEART T-LIGHT HOLDER  | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 71053  |  6 | 3.39 | WHITE METAL LANTERN                 | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84406B |  8 | 2.75 | CREAM CUPID HEARTS COAT HANGER      | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84029G |  6 | 3.39 | KNITTED UNION FLAG HOT WATER BOTTLE | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84029E |  6 | 3.39 | RED WOOLLY HOTTIE WHITE HEART.      | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 22752  |  2 | 7.65 | SET 7 BABUSHKA NESTING BOXES        | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 21730  |  6 | 4.25 | GLASS STAR FROSTED T-LIGHT HOLDER   | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536366 | 22633  |  6 | 1.85 | HAND WARMER UNION JACK              | 2010-12-01 08:28:00 | United Kingdom |\n| 17850 | 536366 | 22632  |  6 | 1.85 | HAND WARMER RED POLKA DOT           | 2010-12-01 08:28:00 | United Kingdom |\n| 13047 | 536367 | 84879  | 32 | 1.69 | ASSORTED COLOUR BIRD ORNAMENT       | 2010-12-01 08:34:00 | United Kingdom |\n\n",
            "text/latex": "A tibble: 10 × 8\n\\begin{tabular}{llllllll}\n CustomerID & InvoiceNo & StockCode & Quantity & UnitPrice & Description & InvoiceDate & Country\\\\\n <dbl> & <chr> & <chr> & <dbl> & <dbl> & <chr> & <dttm> & <chr>\\\\\n\\hline\n\t 17850 & 536365 & 85123A &  6 & 2.55 & WHITE HANGING HEART T-LIGHT HOLDER  & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 71053  &  6 & 3.39 & WHITE METAL LANTERN                 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84406B &  8 & 2.75 & CREAM CUPID HEARTS COAT HANGER      & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84029G &  6 & 3.39 & KNITTED UNION FLAG HOT WATER BOTTLE & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84029E &  6 & 3.39 & RED WOOLLY HOTTIE WHITE HEART.      & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 22752  &  2 & 7.65 & SET 7 BABUSHKA NESTING BOXES        & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 21730  &  6 & 4.25 & GLASS STAR FROSTED T-LIGHT HOLDER   & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536366 & 22633  &  6 & 1.85 & HAND WARMER UNION JACK              & 2010-12-01 08:28:00 & United Kingdom\\\\\n\t 17850 & 536366 & 22632  &  6 & 1.85 & HAND WARMER RED POLKA DOT           & 2010-12-01 08:28:00 & United Kingdom\\\\\n\t 13047 & 536367 & 84879  & 32 & 1.69 & ASSORTED COLOUR BIRD ORNAMENT       & 2010-12-01 08:34:00 & United Kingdom\\\\\n\\end{tabular}\n",
            "text/plain": [
              "   CustomerID InvoiceNo StockCode Quantity UnitPrice\n",
              "1  17850      536365    85123A     6       2.55     \n",
              "2  17850      536365    71053      6       3.39     \n",
              "3  17850      536365    84406B     8       2.75     \n",
              "4  17850      536365    84029G     6       3.39     \n",
              "5  17850      536365    84029E     6       3.39     \n",
              "6  17850      536365    22752      2       7.65     \n",
              "7  17850      536365    21730      6       4.25     \n",
              "8  17850      536366    22633      6       1.85     \n",
              "9  17850      536366    22632      6       1.85     \n",
              "10 13047      536367    84879     32       1.69     \n",
              "   Description                         InvoiceDate         Country       \n",
              "1  WHITE HANGING HEART T-LIGHT HOLDER  2010-12-01 08:26:00 United Kingdom\n",
              "2  WHITE METAL LANTERN                 2010-12-01 08:26:00 United Kingdom\n",
              "3  CREAM CUPID HEARTS COAT HANGER      2010-12-01 08:26:00 United Kingdom\n",
              "4  KNITTED UNION FLAG HOT WATER BOTTLE 2010-12-01 08:26:00 United Kingdom\n",
              "5  RED WOOLLY HOTTIE WHITE HEART.      2010-12-01 08:26:00 United Kingdom\n",
              "6  SET 7 BABUSHKA NESTING BOXES        2010-12-01 08:26:00 United Kingdom\n",
              "7  GLASS STAR FROSTED T-LIGHT HOLDER   2010-12-01 08:26:00 United Kingdom\n",
              "8  HAND WARMER UNION JACK              2010-12-01 08:28:00 United Kingdom\n",
              "9  HAND WARMER RED POLKA DOT           2010-12-01 08:28:00 United Kingdom\n",
              "10 ASSORTED COLOUR BIRD ORNAMENT       2010-12-01 08:34:00 United Kingdom"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "df=df[, c('CustomerID','InvoiceNo','StockCode','Quantity','UnitPrice','Description','InvoiceDate','Country')]\n",
        "head(df)"
      ],
      "metadata": {
        "_uuid": "f9ade594-2c17-4e0e-9b7c-e6a13bc399a3",
        "_cell_guid": "7602fb1a-6b52-414f-8617-65ba9a94bd79",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "1Gld_M250fkb",
        "outputId": "ba7240a9-60f7-4375-ae44-453b09457152",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 286
        }
      },
      "execution_count": 13,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 6 × 8</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>CustomerID</th><th scope=col>InvoiceNo</th><th scope=col>StockCode</th><th scope=col>Quantity</th><th scope=col>UnitPrice</th><th scope=col>Description</th><th scope=col>InvoiceDate</th><th scope=col>Country</th></tr>\n",
              "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>17850</td><td>536365</td><td>85123A</td><td>6</td><td>2.55</td><td>WHITE HANGING HEART T-LIGHT HOLDER </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>71053 </td><td>6</td><td>3.39</td><td>WHITE METAL LANTERN                </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84406B</td><td>8</td><td>2.75</td><td>CREAM CUPID HEARTS COAT HANGER     </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029G</td><td>6</td><td>3.39</td><td>KNITTED UNION FLAG HOT WATER BOTTLE</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029E</td><td>6</td><td>3.39</td><td>RED WOOLLY HOTTIE WHITE HEART.     </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>22752 </td><td>2</td><td>7.65</td><td>SET 7 BABUSHKA NESTING BOXES       </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 6 × 8\n\n| CustomerID &lt;dbl&gt; | InvoiceNo &lt;chr&gt; | StockCode &lt;chr&gt; | Quantity &lt;dbl&gt; | UnitPrice &lt;dbl&gt; | Description &lt;chr&gt; | InvoiceDate &lt;dttm&gt; | Country &lt;chr&gt; |\n|---|---|---|---|---|---|---|---|\n| 17850 | 536365 | 85123A | 6 | 2.55 | WHITE HANGING HEART T-LIGHT HOLDER  | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 71053  | 6 | 3.39 | WHITE METAL LANTERN                 | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84406B | 8 | 2.75 | CREAM CUPID HEARTS COAT HANGER      | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84029G | 6 | 3.39 | KNITTED UNION FLAG HOT WATER BOTTLE | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84029E | 6 | 3.39 | RED WOOLLY HOTTIE WHITE HEART.      | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 22752  | 2 | 7.65 | SET 7 BABUSHKA NESTING BOXES        | 2010-12-01 08:26:00 | United Kingdom |\n\n",
            "text/latex": "A tibble: 6 × 8\n\\begin{tabular}{llllllll}\n CustomerID & InvoiceNo & StockCode & Quantity & UnitPrice & Description & InvoiceDate & Country\\\\\n <dbl> & <chr> & <chr> & <dbl> & <dbl> & <chr> & <dttm> & <chr>\\\\\n\\hline\n\t 17850 & 536365 & 85123A & 6 & 2.55 & WHITE HANGING HEART T-LIGHT HOLDER  & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 71053  & 6 & 3.39 & WHITE METAL LANTERN                 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84406B & 8 & 2.75 & CREAM CUPID HEARTS COAT HANGER      & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84029G & 6 & 3.39 & KNITTED UNION FLAG HOT WATER BOTTLE & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84029E & 6 & 3.39 & RED WOOLLY HOTTIE WHITE HEART.      & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 22752  & 2 & 7.65 & SET 7 BABUSHKA NESTING BOXES        & 2010-12-01 08:26:00 & United Kingdom\\\\\n\\end{tabular}\n",
            "text/plain": [
              "  CustomerID InvoiceNo StockCode Quantity UnitPrice\n",
              "1 17850      536365    85123A    6        2.55     \n",
              "2 17850      536365    71053     6        3.39     \n",
              "3 17850      536365    84406B    8        2.75     \n",
              "4 17850      536365    84029G    6        3.39     \n",
              "5 17850      536365    84029E    6        3.39     \n",
              "6 17850      536365    22752     2        7.65     \n",
              "  Description                         InvoiceDate         Country       \n",
              "1 WHITE HANGING HEART T-LIGHT HOLDER  2010-12-01 08:26:00 United Kingdom\n",
              "2 WHITE METAL LANTERN                 2010-12-01 08:26:00 United Kingdom\n",
              "3 CREAM CUPID HEARTS COAT HANGER      2010-12-01 08:26:00 United Kingdom\n",
              "4 KNITTED UNION FLAG HOT WATER BOTTLE 2010-12-01 08:26:00 United Kingdom\n",
              "5 RED WOOLLY HOTTIE WHITE HEART.      2010-12-01 08:26:00 United Kingdom\n",
              "6 SET 7 BABUSHKA NESTING BOXES        2010-12-01 08:26:00 United Kingdom"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "summary(df)"
      ],
      "metadata": {
        "_uuid": "4b01b353-a931-4404-bf24-9d2d4358c042",
        "_cell_guid": "e7b8b1af-6ac8-42f6-99d6-f297e15d4047",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "7x3sT9xA0fkc",
        "outputId": "ed88f15e-7c40-4ab4-c094-f9cfc520b184",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 433
        }
      },
      "execution_count": 14,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "   CustomerID         InvoiceNo          StockCode         Quantity         \n",
              " Min.   :12346    Length   :541909   Length   :541909   Min.   :-80995.000  \n",
              " 1st Qu.:13953    N.unique : 25900   N.unique :  4070   1st Qu.:     1.000  \n",
              " Median :15152    N.blank  :     0   N.blank  :     0   Median :     3.000  \n",
              " Mean   :15288    Min.nchar:     6   Min.nchar:     1   Mean   :     9.552  \n",
              " 3rd Qu.:16791    Max.nchar:     7   Max.nchar:    12   3rd Qu.:    10.000  \n",
              " Max.   :18287                                          Max.   : 80995.000  \n",
              " NAs    :135080                                                             \n",
              "   UnitPrice             Description      InvoiceDate                 \n",
              " Min.   :-11062.060   Length   :541909   Min.   :2010-12-01 08:26:00  \n",
              " 1st Qu.:     1.250   N.unique :  4211   1st Qu.:2011-03-28 11:34:00  \n",
              " Median :     2.080   N.blank  :     0   Median :2011-07-19 17:17:00  \n",
              " Mean   :     4.611   Min.nchar:     1   Mean   :2011-07-04 13:34:57  \n",
              " 3rd Qu.:     4.130   Max.nchar:    35   3rd Qu.:2011-10-19 11:27:00  \n",
              " Max.   : 38970.000   NAs      :  1454   Max.   :2011-12-09 12:50:00  \n",
              "                                                                      \n",
              "      Country      \n",
              " Length   :541909  \n",
              " N.unique :    38  \n",
              " N.blank  :     0  \n",
              " Min.nchar:     3  \n",
              " Max.nchar:    20  \n",
              "                   \n",
              "                   "
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "str(df)"
      ],
      "metadata": {
        "_uuid": "67b534e4-d146-46a7-8564-a2951460fcf3",
        "_cell_guid": "d7af2f93-86c7-4773-81cb-dd9549a6216e",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "0Ydgwqkh0fkc",
        "outputId": "a3d01477-66d0-4d36-a3ba-6e1fbfac4a8c",
        "colab": {
          "base_uri": "https://localhost:8080/"
        }
      },
      "execution_count": 15,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "tibble [541,909 × 8] (S3: tbl_df/tbl/data.frame)\n",
            " $ CustomerID : num [1:541909] 17850 17850 17850 17850 17850 ...\n",
            " $ InvoiceNo  : chr [1:541909] \"536365\" \"536365\" \"536365\" \"536365\" ...\n",
            " $ StockCode  : chr [1:541909] \"85123A\" \"71053\" \"84406B\" \"84029G\" ...\n",
            " $ Quantity   : num [1:541909] 6 6 8 6 6 2 6 6 6 32 ...\n",
            " $ UnitPrice  : num [1:541909] 2.55 3.39 2.75 3.39 3.39 7.65 4.25 1.85 1.85 1.69 ...\n",
            " $ Description: chr [1:541909] \"WHITE HANGING HEART T-LIGHT HOLDER\" \"WHITE METAL LANTERN\" \"CREAM CUPID HEARTS COAT HANGER\" \"KNITTED UNION FLAG HOT WATER BOTTLE\" ...\n",
            " $ InvoiceDate: POSIXct[1:541909], format: \"2010-12-01 08:26:00\" \"2010-12-01 08:26:00\" ...\n",
            " $ Country    : chr [1:541909] \"United Kingdom\" \"United Kingdom\" \"United Kingdom\" \"United Kingdom\" ...\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "nrow(df)\n",
        "ncol(df)"
      ],
      "metadata": {
        "_uuid": "2a397eea-870b-41f6-b55e-1d2d8ffad179",
        "_cell_guid": "d27d1831-877d-4d83-a893-ccfddd6d53f0",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "cMhepsn30fkc",
        "outputId": "c05215e6-b81a-41f8-b11e-89f532ae7cd9",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 52
        }
      },
      "execution_count": 16,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "541909"
            ],
            "text/markdown": "541909",
            "text/latex": "541909",
            "text/plain": [
              "[1] 541909"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "8"
            ],
            "text/markdown": "8",
            "text/latex": "8",
            "text/plain": [
              "[1] 8"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "colSums(is.na(df))"
      ],
      "metadata": {
        "_uuid": "a30461cf-8a55-4e92-bf49-e5d1db2183d9",
        "_cell_guid": "fd5537ac-6762-4751-837d-6983744205a7",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "3pisEqJi0fkc",
        "outputId": "b060f7e9-4d32-4a33-bad6-0c6379a5cfc3",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 34
        }
      },
      "execution_count": 17,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<style>\n",
              ".dl-inline {width: auto; margin:0; padding: 0}\n",
              ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
              ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
              ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
              "</style><dl class=dl-inline><dt>CustomerID</dt><dd>135080</dd><dt>InvoiceNo</dt><dd>0</dd><dt>StockCode</dt><dd>0</dd><dt>Quantity</dt><dd>0</dd><dt>UnitPrice</dt><dd>0</dd><dt>Description</dt><dd>1454</dd><dt>InvoiceDate</dt><dd>0</dd><dt>Country</dt><dd>0</dd></dl>\n"
            ],
            "text/markdown": "CustomerID\n:   135080InvoiceNo\n:   0StockCode\n:   0Quantity\n:   0UnitPrice\n:   0Description\n:   1454InvoiceDate\n:   0Country\n:   0\n\n",
            "text/latex": "\\begin{description*}\n\\item[CustomerID] 135080\n\\item[InvoiceNo] 0\n\\item[StockCode] 0\n\\item[Quantity] 0\n\\item[UnitPrice] 0\n\\item[Description] 1454\n\\item[InvoiceDate] 0\n\\item[Country] 0\n\\end{description*}\n",
            "text/plain": [
              " CustomerID   InvoiceNo   StockCode    Quantity   UnitPrice Description \n",
              "     135080           0           0           0           0        1454 \n",
              "InvoiceDate     Country \n",
              "          0           0 "
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "country=df$Country\n",
        "country[!duplicated(country)]"
      ],
      "metadata": {
        "_uuid": "4eb7d75c-70ff-4a0b-8827-50e2f0299a70",
        "_cell_guid": "d766d533-e47c-4764-ab9d-2d82aa32cd62",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "lIyToHeA0fkd",
        "outputId": "c2d6afa6-8b6d-43cc-a91d-b3237a152123",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 69
        }
      },
      "execution_count": 18,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<style>\n",
              ".list-inline {list-style: none; margin:0; padding: 0}\n",
              ".list-inline>li {display: inline-block}\n",
              ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
              "</style>\n",
              "<ol class=list-inline><li>'United Kingdom'</li><li>'France'</li><li>'Australia'</li><li>'Netherlands'</li><li>'Germany'</li><li>'Norway'</li><li>'EIRE'</li><li>'Switzerland'</li><li>'Spain'</li><li>'Poland'</li><li>'Portugal'</li><li>'Italy'</li><li>'Belgium'</li><li>'Lithuania'</li><li>'Japan'</li><li>'Iceland'</li><li>'Channel Islands'</li><li>'Denmark'</li><li>'Cyprus'</li><li>'Sweden'</li><li>'Austria'</li><li>'Israel'</li><li>'Finland'</li><li>'Bahrain'</li><li>'Greece'</li><li>'Hong Kong'</li><li>'Singapore'</li><li>'Lebanon'</li><li>'United Arab Emirates'</li><li>'Saudi Arabia'</li><li>'Czech Republic'</li><li>'Canada'</li><li>'Unspecified'</li><li>'Brazil'</li><li>'USA'</li><li>'European Community'</li><li>'Malta'</li><li>'RSA'</li></ol>\n"
            ],
            "text/markdown": "1. 'United Kingdom'\n2. 'France'\n3. 'Australia'\n4. 'Netherlands'\n5. 'Germany'\n6. 'Norway'\n7. 'EIRE'\n8. 'Switzerland'\n9. 'Spain'\n10. 'Poland'\n11. 'Portugal'\n12. 'Italy'\n13. 'Belgium'\n14. 'Lithuania'\n15. 'Japan'\n16. 'Iceland'\n17. 'Channel Islands'\n18. 'Denmark'\n19. 'Cyprus'\n20. 'Sweden'\n21. 'Austria'\n22. 'Israel'\n23. 'Finland'\n24. 'Bahrain'\n25. 'Greece'\n26. 'Hong Kong'\n27. 'Singapore'\n28. 'Lebanon'\n29. 'United Arab Emirates'\n30. 'Saudi Arabia'\n31. 'Czech Republic'\n32. 'Canada'\n33. 'Unspecified'\n34. 'Brazil'\n35. 'USA'\n36. 'European Community'\n37. 'Malta'\n38. 'RSA'\n\n\n",
            "text/latex": "\\begin{enumerate*}\n\\item 'United Kingdom'\n\\item 'France'\n\\item 'Australia'\n\\item 'Netherlands'\n\\item 'Germany'\n\\item 'Norway'\n\\item 'EIRE'\n\\item 'Switzerland'\n\\item 'Spain'\n\\item 'Poland'\n\\item 'Portugal'\n\\item 'Italy'\n\\item 'Belgium'\n\\item 'Lithuania'\n\\item 'Japan'\n\\item 'Iceland'\n\\item 'Channel Islands'\n\\item 'Denmark'\n\\item 'Cyprus'\n\\item 'Sweden'\n\\item 'Austria'\n\\item 'Israel'\n\\item 'Finland'\n\\item 'Bahrain'\n\\item 'Greece'\n\\item 'Hong Kong'\n\\item 'Singapore'\n\\item 'Lebanon'\n\\item 'United Arab Emirates'\n\\item 'Saudi Arabia'\n\\item 'Czech Republic'\n\\item 'Canada'\n\\item 'Unspecified'\n\\item 'Brazil'\n\\item 'USA'\n\\item 'European Community'\n\\item 'Malta'\n\\item 'RSA'\n\\end{enumerate*}\n",
            "text/plain": [
              " [1] \"United Kingdom\"       \"France\"               \"Australia\"           \n",
              " [4] \"Netherlands\"          \"Germany\"              \"Norway\"              \n",
              " [7] \"EIRE\"                 \"Switzerland\"          \"Spain\"               \n",
              "[10] \"Poland\"               \"Portugal\"             \"Italy\"               \n",
              "[13] \"Belgium\"              \"Lithuania\"            \"Japan\"               \n",
              "[16] \"Iceland\"              \"Channel Islands\"      \"Denmark\"             \n",
              "[19] \"Cyprus\"               \"Sweden\"               \"Austria\"             \n",
              "[22] \"Israel\"               \"Finland\"              \"Bahrain\"             \n",
              "[25] \"Greece\"               \"Hong Kong\"            \"Singapore\"           \n",
              "[28] \"Lebanon\"              \"United Arab Emirates\" \"Saudi Arabia\"        \n",
              "[31] \"Czech Republic\"       \"Canada\"               \"Unspecified\"         \n",
              "[34] \"Brazil\"               \"USA\"                  \"European Community\"  \n",
              "[37] \"Malta\"                \"RSA\"                 "
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "TotalAmount = df$Quantity * df$UnitPrice\n",
        "df$TotalAmount <- TotalAmount"
      ],
      "metadata": {
        "_uuid": "069f2c7d-b665-49ee-b64e-a418bc85290a",
        "_cell_guid": "8a4fb16e-3a6d-44d5-8f06-5280f130af3f",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "W5S7T2hO0fkd"
      },
      "execution_count": 19,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "new_df = df[,c('CustomerID','InvoiceNo','StockCode','Quantity','TotalAmount','InvoiceDate','Country')]\n",
        "\n",
        "new_df2 = df\n",
        "tracemem(new_df2)==tracemem(df)"
      ],
      "metadata": {
        "_uuid": "b3fcc449-b36c-45f6-9d2e-4a88791b7591",
        "_cell_guid": "4b549f58-6238-4ad2-be0c-9ebdf5205219",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "qdaz_4R10fkd",
        "outputId": "1ddfb676-18c0-4289-cd72-d810c1093240",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 34
        }
      },
      "execution_count": 20,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "TRUE"
            ],
            "text/markdown": "TRUE",
            "text/latex": "TRUE",
            "text/plain": [
              "[1] TRUE"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "head(new_df)"
      ],
      "metadata": {
        "_uuid": "292b1571-7264-4a8f-8f18-5b3a68e5078e",
        "_cell_guid": "79895717-d36b-4ad9-85ba-f32590051277",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "FUbL_ZPn0fkd",
        "outputId": "98cf5677-b9d2-449b-a3eb-d00f3e0c5ab1",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 286
        }
      },
      "execution_count": 21,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 6 × 7</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>CustomerID</th><th scope=col>InvoiceNo</th><th scope=col>StockCode</th><th scope=col>Quantity</th><th scope=col>TotalAmount</th><th scope=col>InvoiceDate</th><th scope=col>Country</th></tr>\n",
              "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>17850</td><td>536365</td><td>85123A</td><td>6</td><td>15.30</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>71053 </td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84406B</td><td>8</td><td>22.00</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029G</td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029E</td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>22752 </td><td>2</td><td>15.30</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 6 × 7\n\n| CustomerID &lt;dbl&gt; | InvoiceNo &lt;chr&gt; | StockCode &lt;chr&gt; | Quantity &lt;dbl&gt; | TotalAmount &lt;dbl&gt; | InvoiceDate &lt;dttm&gt; | Country &lt;chr&gt; |\n|---|---|---|---|---|---|---|\n| 17850 | 536365 | 85123A | 6 | 15.30 | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 71053  | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84406B | 8 | 22.00 | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84029G | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 84029E | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom |\n| 17850 | 536365 | 22752  | 2 | 15.30 | 2010-12-01 08:26:00 | United Kingdom |\n\n",
            "text/latex": "A tibble: 6 × 7\n\\begin{tabular}{lllllll}\n CustomerID & InvoiceNo & StockCode & Quantity & TotalAmount & InvoiceDate & Country\\\\\n <dbl> & <chr> & <chr> & <dbl> & <dbl> & <dttm> & <chr>\\\\\n\\hline\n\t 17850 & 536365 & 85123A & 6 & 15.30 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 71053  & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84406B & 8 & 22.00 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84029G & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 84029E & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\t 17850 & 536365 & 22752  & 2 & 15.30 & 2010-12-01 08:26:00 & United Kingdom\\\\\n\\end{tabular}\n",
            "text/plain": [
              "  CustomerID InvoiceNo StockCode Quantity TotalAmount InvoiceDate        \n",
              "1 17850      536365    85123A    6        15.30       2010-12-01 08:26:00\n",
              "2 17850      536365    71053     6        20.34       2010-12-01 08:26:00\n",
              "3 17850      536365    84406B    8        22.00       2010-12-01 08:26:00\n",
              "4 17850      536365    84029G    6        20.34       2010-12-01 08:26:00\n",
              "5 17850      536365    84029E    6        20.34       2010-12-01 08:26:00\n",
              "6 17850      536365    22752     2        15.30       2010-12-01 08:26:00\n",
              "  Country       \n",
              "1 United Kingdom\n",
              "2 United Kingdom\n",
              "3 United Kingdom\n",
              "4 United Kingdom\n",
              "5 United Kingdom\n",
              "6 United Kingdom"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Grouping countries by TotalAmount of sales\n",
        "\n",
        "country_price = new_df %>%\n",
        "  group_by(Country) %>%\n",
        "  summarise(Quantity = sum(Quantity))\n",
        "\n",
        "country_price = country_price[order(-country_price$Quantity),]\n",
        "country_price"
      ],
      "metadata": {
        "_uuid": "1ff28568-1aec-4300-92b9-b7d105cc56cd",
        "_cell_guid": "684a3050-3f2b-4b56-9a6e-af0b9bfca654",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "4nQq_c3w0fke",
        "outputId": "601f3118-dbc4-4535-a025-240eae9c001c",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 1000
        }
      },
      "execution_count": 22,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 38 × 2</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>Country</th><th scope=col>Quantity</th></tr>\n",
              "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>United Kingdom      </td><td>4263829</td></tr>\n",
              "\t<tr><td>Netherlands         </td><td> 200128</td></tr>\n",
              "\t<tr><td>EIRE                </td><td> 142637</td></tr>\n",
              "\t<tr><td>Germany             </td><td> 117448</td></tr>\n",
              "\t<tr><td>France              </td><td> 110480</td></tr>\n",
              "\t<tr><td>Australia           </td><td>  83653</td></tr>\n",
              "\t<tr><td>Sweden              </td><td>  35637</td></tr>\n",
              "\t<tr><td>Switzerland         </td><td>  30325</td></tr>\n",
              "\t<tr><td>Spain               </td><td>  26824</td></tr>\n",
              "\t<tr><td>Japan               </td><td>  25218</td></tr>\n",
              "\t<tr><td>Belgium             </td><td>  23152</td></tr>\n",
              "\t<tr><td>Norway              </td><td>  19247</td></tr>\n",
              "\t<tr><td>Portugal            </td><td>  16180</td></tr>\n",
              "\t<tr><td>Finland             </td><td>  10666</td></tr>\n",
              "\t<tr><td>Channel Islands     </td><td>   9479</td></tr>\n",
              "\t<tr><td>Denmark             </td><td>   8188</td></tr>\n",
              "\t<tr><td>Italy               </td><td>   7999</td></tr>\n",
              "\t<tr><td>Cyprus              </td><td>   6317</td></tr>\n",
              "\t<tr><td>Singapore           </td><td>   5234</td></tr>\n",
              "\t<tr><td>Austria             </td><td>   4827</td></tr>\n",
              "\t<tr><td>Hong Kong           </td><td>   4769</td></tr>\n",
              "\t<tr><td>Israel              </td><td>   4353</td></tr>\n",
              "\t<tr><td>Poland              </td><td>   3653</td></tr>\n",
              "\t<tr><td>Unspecified         </td><td>   3300</td></tr>\n",
              "\t<tr><td>Canada              </td><td>   2763</td></tr>\n",
              "\t<tr><td>Iceland             </td><td>   2458</td></tr>\n",
              "\t<tr><td>Greece              </td><td>   1556</td></tr>\n",
              "\t<tr><td>USA                 </td><td>   1034</td></tr>\n",
              "\t<tr><td>United Arab Emirates</td><td>    982</td></tr>\n",
              "\t<tr><td>Malta               </td><td>    944</td></tr>\n",
              "\t<tr><td>Lithuania           </td><td>    652</td></tr>\n",
              "\t<tr><td>Czech Republic      </td><td>    592</td></tr>\n",
              "\t<tr><td>European Community  </td><td>    497</td></tr>\n",
              "\t<tr><td>Lebanon             </td><td>    386</td></tr>\n",
              "\t<tr><td>Brazil              </td><td>    356</td></tr>\n",
              "\t<tr><td>RSA                 </td><td>    352</td></tr>\n",
              "\t<tr><td>Bahrain             </td><td>    260</td></tr>\n",
              "\t<tr><td>Saudi Arabia        </td><td>     75</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 38 × 2\n\n| Country &lt;chr&gt; | Quantity &lt;dbl&gt; |\n|---|---|\n| United Kingdom       | 4263829 |\n| Netherlands          |  200128 |\n| EIRE                 |  142637 |\n| Germany              |  117448 |\n| France               |  110480 |\n| Australia            |   83653 |\n| Sweden               |   35637 |\n| Switzerland          |   30325 |\n| Spain                |   26824 |\n| Japan                |   25218 |\n| Belgium              |   23152 |\n| Norway               |   19247 |\n| Portugal             |   16180 |\n| Finland              |   10666 |\n| Channel Islands      |    9479 |\n| Denmark              |    8188 |\n| Italy                |    7999 |\n| Cyprus               |    6317 |\n| Singapore            |    5234 |\n| Austria              |    4827 |\n| Hong Kong            |    4769 |\n| Israel               |    4353 |\n| Poland               |    3653 |\n| Unspecified          |    3300 |\n| Canada               |    2763 |\n| Iceland              |    2458 |\n| Greece               |    1556 |\n| USA                  |    1034 |\n| United Arab Emirates |     982 |\n| Malta                |     944 |\n| Lithuania            |     652 |\n| Czech Republic       |     592 |\n| European Community   |     497 |\n| Lebanon              |     386 |\n| Brazil               |     356 |\n| RSA                  |     352 |\n| Bahrain              |     260 |\n| Saudi Arabia         |      75 |\n\n",
            "text/latex": "A tibble: 38 × 2\n\\begin{tabular}{ll}\n Country & Quantity\\\\\n <chr> & <dbl>\\\\\n\\hline\n\t United Kingdom       & 4263829\\\\\n\t Netherlands          &  200128\\\\\n\t EIRE                 &  142637\\\\\n\t Germany              &  117448\\\\\n\t France               &  110480\\\\\n\t Australia            &   83653\\\\\n\t Sweden               &   35637\\\\\n\t Switzerland          &   30325\\\\\n\t Spain                &   26824\\\\\n\t Japan                &   25218\\\\\n\t Belgium              &   23152\\\\\n\t Norway               &   19247\\\\\n\t Portugal             &   16180\\\\\n\t Finland              &   10666\\\\\n\t Channel Islands      &    9479\\\\\n\t Denmark              &    8188\\\\\n\t Italy                &    7999\\\\\n\t Cyprus               &    6317\\\\\n\t Singapore            &    5234\\\\\n\t Austria              &    4827\\\\\n\t Hong Kong            &    4769\\\\\n\t Israel               &    4353\\\\\n\t Poland               &    3653\\\\\n\t Unspecified          &    3300\\\\\n\t Canada               &    2763\\\\\n\t Iceland              &    2458\\\\\n\t Greece               &    1556\\\\\n\t USA                  &    1034\\\\\n\t United Arab Emirates &     982\\\\\n\t Malta                &     944\\\\\n\t Lithuania            &     652\\\\\n\t Czech Republic       &     592\\\\\n\t European Community   &     497\\\\\n\t Lebanon              &     386\\\\\n\t Brazil               &     356\\\\\n\t RSA                  &     352\\\\\n\t Bahrain              &     260\\\\\n\t Saudi Arabia         &      75\\\\\n\\end{tabular}\n",
            "text/plain": [
              "   Country              Quantity\n",
              "1  United Kingdom       4263829 \n",
              "2  Netherlands           200128 \n",
              "3  EIRE                  142637 \n",
              "4  Germany               117448 \n",
              "5  France                110480 \n",
              "6  Australia              83653 \n",
              "7  Sweden                 35637 \n",
              "8  Switzerland            30325 \n",
              "9  Spain                  26824 \n",
              "10 Japan                  25218 \n",
              "11 Belgium                23152 \n",
              "12 Norway                 19247 \n",
              "13 Portugal               16180 \n",
              "14 Finland                10666 \n",
              "15 Channel Islands         9479 \n",
              "16 Denmark                 8188 \n",
              "17 Italy                   7999 \n",
              "18 Cyprus                  6317 \n",
              "19 Singapore               5234 \n",
              "20 Austria                 4827 \n",
              "21 Hong Kong               4769 \n",
              "22 Israel                  4353 \n",
              "23 Poland                  3653 \n",
              "24 Unspecified             3300 \n",
              "25 Canada                  2763 \n",
              "26 Iceland                 2458 \n",
              "27 Greece                  1556 \n",
              "28 USA                     1034 \n",
              "29 United Arab Emirates     982 \n",
              "30 Malta                    944 \n",
              "31 Lithuania                652 \n",
              "32 Czech Republic           592 \n",
              "33 European Community       497 \n",
              "34 Lebanon                  386 \n",
              "35 Brazil                   356 \n",
              "36 RSA                      352 \n",
              "37 Bahrain                  260 \n",
              "38 Saudi Arabia              75 "
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Top 5 Companies with high number of purchase\n",
        "\n",
        "bp_country_top=country_price$Country[1:5]\n",
        "bp_quantity_top=country_price$Quantity[1:5]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_quantity_top, names=bp_country_top, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "55999747-b5e9-47b0-9f00-f9a16c2cbe64",
        "_cell_guid": "dbfa45a8-65c2-4697-863c-dba7d336d25d",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "DwtujVrB0fke",
        "outputId": "de1271eb-0cc4-4016-9855-4a0a43943532",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 437
        }
      },
      "execution_count": 23,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "plot without title"
            ],
            "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAACXBIWXMAABJ0AAASdAHeZh94\nAAAgAElEQVR4nOzdaWAV5cH47TlkIxAEkU0wLEHUgsUoKItSUIsFxYAoliJaraGCCihg3Vla\nBZcqVkVsa6kWLAqVKgWR1oUUrCziQh8pVlQWlV2DUIiynPfD+fe8KSAESAjeXNen5D4z99wn\n89jnx8ycJBaPxyMAAL79KpT3AgAAKB3CDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQqeW9AChDK1eu\nfP/990u+fY0aNXJzc8tuPQBQpmLxeLy81wBlpUePHn9+4fnUjIySbLxz+47M9PSNGzeW9aoA\noIy4YkfIduzY0azzuWf2uawkG694893X7h9b1ksCgLLjGTsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIu9BMmDAh9s0effTR8l4g\nAFBWUst7AZSJVq1atW7devfx3NzcQ78YAODQEHZh6tSp0/Dhw8t7FQDAIeVW7JGoZ8+esVhs\n7dq1HTt2zMzMnDp1amJ8/vz5F110UY0aNdLT0xs2bHj55ZcvW7YsuVevXr1isdjmzZtvvvnm\nhg0bZmRkZGdnjx49Oh6PJ7dZvXp1fn5+vXr1KleufMopp/zqV7/avn178tU1a9Zcd911DRo0\nSE9Pr1mzZrdu3RYsWHCo3jQAhM8VuyNRenp6FEU33nhjWlra0KFDc3JyoihauHBh+/btq1ev\nPnDgwDp16nz00Udjxoz561//unjx4mOOOSa51yWXXNKoUaNnnnlm586dI0aMGDRoULVq1a66\n6qooitatW9eyZcvNmzdfccUVDRo0mDVr1g033PDPf/7ziSeeSLzaqlWrwsLCvn37nnzyyStX\nrnzsscfatWs3c+bM9u3bl+ePAwBCIeyORGlpaVEUrV+/fsaMGRUq/L+rtvPnz2/atOkDDzzQ\noUOHxEi9evX69+8/ceLE66+/Poqi1NTUKIqqV68+duzYxAZjx45t3LjxlClTEmE3bNiwTz/9\ndObMmeedd14URYMHD+7Spcvvfve7G2+8sVmzZolX33jjjZYtWyZ27927d7NmzYYMGeK6HQCU\nCrdij0SxWCyKoh//+MfJqouiqF+/fgsXLkxU3bZt24qKipo2bRpFUfG7sYm9kl/n5ORUqlTp\nk08+iaIoHo9PmjQpOzu7Y8eOyQ0efvjhV199tXbt2vF4fPLkyc2bNz/uuONW/1daWlrbtm3f\nfPPNzZs3l+n7BYAjhCt2YRoxYsSIESN2H3/77beTH4w98cQTd3l1/PjxTzzxxKJFiwoLC5OD\nxR+Si6Kofv36xb9NS0vbtm1bFEWrVq3asGHDaaedlqjGhJycnMR93jVr1qxfv379+vXHHnvs\n7qtasWJFIiIBgIMh7MJ0+umnn3HGGbuP16xZM/l11apVi7902223jRo1qmXLlqNHj27UqFFG\nRsZ7772Xn5+/ywyJ27i727p1axRFGRkZe3x106ZNURTl5uaOGjVq91fr1q27tzcDAJSMsAvT\n+eefv1+/7qSoqOihhx7Kzs5+7bXXsrKyEoMbN24s+Qx16tSJoqj4pb7iqlSpkviiU6dOJZ8T\nANgvnrEjiqJo9erVW7dubdmyZbLqoigqKCgo+QyVK1euWbPmv/71r8Sd2YT333//0Ucffe+9\n92rXrl2jRo0lS5bsUn7r1q07+MUDAAnCjiiKotq1a8diseKfk3jnnXf+8Ic/RFFUVFRUwkm6\ndu26YcOGp556KjkyfPjw/v37f/XVV1EU9ejRo6io6P7770++um7duubNm1944YWl8hYAALdi\niaIoyszMvOCCC6ZNm9a3b98OHTosXrz40Ucfffrpp/Py8qZPnz5x4sS8vLx9TjJs2LBp06b1\n69fv3XffbdCgQUFBwbRp06644orTTjstiqLhw4dPnz595MiRq1atat++/Wefffb4449v2LBh\nwIABZf/+AOCI4Iod/8+4ceN69eo1ZcqUvn37vv7661OnTu3cufOdd95ZWFg4aNCgxKcf9u64\n446bO3duz549J02adNttty1evPiBBx4YN25c4tVatWrNmzevX79+L7/8cn5+/n333Zebmztn\nzpzivx4FADgYseJ/DwoC07179w93bDmzz2Ul2XjFm+++dv/Y//znP2W9KgAoI67YAQAEQtgB\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELY\nAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC\n2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAE\nQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEA\nBELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABCK1vBcAZSgW\niy15Zfay+W+XZOPtX31VoYJ/6gDwLRaLx+PlvQYoK4sWLZo7d27Jtz/uuOPOP//8slsPAJQp\nYQcAEAg3ngAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAA\nAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewA\nAAIh7AAAApFa3guAMjRjxoyCgoL92iU7O/u6664ro/UAQJmKxePx8l4DlJXu3bu/Ou+NGjn1\nS7j9fzZ88fWaDRs2bCjTVQFAGXHFjsA1aHnKmX0uK+HGH/3jzQW/nlCm6wGAsuMZOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIu8NUPB6f\nMmXKxRdfnJ2dXbFixYoVKzZq1Ojqq6+eN29eeS8NADhMpZb3AtiDL774okePHq+88kpWVtbZ\nZ5/doEGDzZs3L168eNy4cb///e9Hjhx5yy23lPcaAYDDjrA77MTj8R/+8IevvPLKD3/4w8ce\ne6x69erJlxYsWHDxxRffeuutzZo1u/DCC8txkQDAYcit2MPOtGnT/va3v7Vp0+aPf/xj8aqL\nouj000+fMmVKnz59jjrqqOLja9asue666xo0aJCenl6zZs1u3botWLAg+WrPnj1jsdjatWs7\nduyYmZk5derUKIp69eoVi8UKCwuvueaa2rVrV6pUqXXr1vPnz9+yZcsNN9xQr169rKystm3b\nvvXWW8UPNH/+/IsuuqhGjRrp6ekNGza8/PLLly1blnw1MefmzZtvvvnmhg0bZmRkZGdnjx49\nOh6PR1HUrl27lJSUlStXFp9ww4YNaWlpbdq0KbUfHwAcwYTdYWf8+PFRFN16660VKuzh7LRs\n2fI3v/lN+/btkyPr1q1r1arV008//aMf/WjcuHGDBg1auHBhu3btCgoKEhukp6dHUXTjjTem\npaUNHTo0JycnOdijR4969eq99NJLY8eOfffdd3v06PHDH/6wYsWKU6dOfeqpp/71r3+df/75\n27ZtS8yzcOHC9u3bz58/f+DAgWPGjPnRj370wgsvtGrVasOGDcUPdMkll3z55ZfPPPPMa6+9\n1rRp00GDBj355JNRFOXn5+/cufMPf/hD8bfz3HPPbd++/corryzVHyEAHKHcij3szJs3LxaL\nnX322SXcftiwYZ9++ukbb7zRsmXLxEjv3r2bNWs2ZMiQxHW7tLS0KIrWr18/Y8aMZCympqZG\nUdSkSZOhQ4dGUXTqqae++OKLkyZNOuOMM+65554oilq0aDF79uxf/epXCxYsaNu2bRRF8+fP\nb9q06QMPPNChQ4fEJPXq1evfv//EiROvv/765JzVq1cfO3ZsYoOxY8c2btx4ypQpV111VY8e\nPQYOHPjUU0/dfvvtycVPmjSpYsWKPXv2PKgfGQAQRZErdoehNWvWVK1aNSsrqyQbx+PxyZMn\nN2/e/Ljjjlv9X2lpaW3btn3zzTc3b94cRVEsFoui6Mc//vHulwC7d++e/LpJkyZRFHXt2jU5\ncuKJJ0ZRtGrVqsS3/fr1W7hwYaLqtm3bVlRU1LRp0yiKit+NTRwo+XVOTk6lSpU++eSTKIoq\nVar0ox/96IMPPnj99dcTr65bt27WrFkXXXRR1apVS/JmAYC9E3aHnZSUlJ07d+4yeNZZZ8X+\nV2FhYRRFa9euXb9+/VtvvXXs/5o5c2YURStWrEjOkKi0XdSrVy/5deJ6W/GRxKW+5K3YKIrG\njx/fvn37o48+Oj09PTMz89xzz42iaPv27cXnrF+/fvFv09LSkjPk5+dHUZS4MxtF0XPPPbdj\nx46rrrqqZD8YAGAf3Io97NStW3fp0qWff/558U9OdOvW7eSTT058/fLLL3/44YeJrzdt2hRF\nUW5u7qhRo/Y4VfLrPV4VS6Tb3keSbrvttlGjRrVs2XL06NGNGjXKyMh47733Eq1WwhlatGhx\n6qmnTpo06eGHH87MzJw0aVJ2dnaiDgGAgyfsDjtnnXXW0qVLX3zxxd69eycHhwwZkvy6Z8+e\nybCrUqVK4otOnTqV6aqKiooeeuih7Ozs1157LXmbeOPGjfs7z9VXX3399ddPnz79rLPOKigo\n+KbPiAAAB8D/Tz3sJK6B/fznP9+yZcs+N65du3aNGjWWLFmSuDObtG7dutJd1erVq7du3dqy\nZcviD/8lP3hbcpdddllmZuazzz777LPP7ty50+dhAaAUCbvDzplnnnn55Zd/8MEHnTp1Wr58\nefGXvvrqq4cffvgvf/lLlSpVEr9bJIqiHj16FBUV3X///cnN1q1b17x589L9Dca1a9eOxWLF\nPyfxzjvvJH53SVFRUcnnqVatWvfu3V988cUnn3zyrLPOOv7440txkQBwhHMr9nD029/+Nh6P\nT5gw4YQTTvje9753wgkn7Ny5c8WKFbNnz960adNpp5321FNPVapUKbHx8OHDp0+fPnLkyFWr\nVrVv3/6zzz57/PHHN2zYMGDAgFJcUmZm5gUXXDBt2rS+fft26NBh8eLFjz766NNPP52Xlzd9\n+vSJEyfm5eWVcKr8/Pynn376nXfeeeKJJ0pxhQCAK3aHo4yMjPHjx7/22muXXnrp0qVLx40b\nN2HChA8++KBbt24vvPDCm2++mfwgRRRFtWrVmjdvXr9+/V5++eX8/Pz77rsvNzd3zpw5HTt2\nLN1VjRs3rlevXlOmTOnbt+/rr78+derUzp0733nnnYWFhYMGDUp8jKMkOnToUL9+/UqVKl16\n6aWlu0IAOMLFEn/uCQ6ZlStXNm7c+Oqrr07+HuOy07179w93bDmzz2Ul3P6jf7y54NcTkn9L\nAwC+XVyx41AbPHhwFEU33nhjeS8EAELjGTsOkaVLl/71r3994YUX/vrXvw4bNuyEE04o7xUB\nQGiEHYfIokWLrr/++ho1aowcOfKWW24p7+UAQICEHYdI9+7dd/9TaQBAKfKMHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBA\nIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0A\nQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQd\nAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCE\nHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAgUst7AVC2vv7Pli9Xry3hxlsLN5bpYgCgTAk7QpaV\nlbXkz39e8srsku9Sv379slsPAJSpWDweL+81QFnZunXrqlWr9muXo48++uijjy6j9QBAmRJ2\nAACB8OEJAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBApJb3AqAM3X333ePGjTuwfVNSUh555JEf/OAHpbskACg7wo6QLVy48Kusise3a3Ug\n+z77wr/+9S9hB8C3iLAjcMc0zG7a6ewD2PG9Ga+U+mIAoEx5xg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwu5IN2HChNherV+/PoqiJUuW\nxGKxTp067X3HjIyMnJycPn36fPzxx/t7CADgIKWW9wI4LLRq1ap169Z7fCkzM3MvO5555pln\nnXVW8tsvvvhiwYIFTzzxxOTJk+fMmXPyyScf/CEAgBISdkRRFHXq1Gn48OEHsOP3v//93Xf8\n5S9/edNNN912221Tp049+EMAACXkViylb8CAAenp6a+//np5LwQAjizCjtIXj8d37txZuXLl\n8l4IABxZhB2l7957792+fXvHjh3LeyEAcGTxjB1RFEUjRowYMWLE7uPDhg3b+4Nxs2bNKr5B\nYWHhvHnz5s6de/zxx//85z8vlUMAACUk7IiiKGrTpk3btm13H9/jYHEFBQUFBQXFR2rVqnXb\nbbcNHjy4evXqpXIIAKCEhB1RFEXnnXfegV02K369bevWrU2bNt2wYUO/fv12qbqDOQQAUEKe\nsaPUZGZmPvTQQ5s2berfv395rwUAjkTCjtLUtWvXzp07P//8888//3x5rwUAjjjCjlL2q1/9\nKiMjo3///ps2bSrvtQDAkcUzdkRRFL300kuFhYV7fOmCCy7Yr19c0qRJk8GDB48cOfL2229/\n+OGHy+IQAMAeCTuiKIrmzZs3b968Pb5Uo0aN/a2u22+/ffz48WPGjOndu/cZZ5xRFocAAHYX\ni8fj5b0GKCvdu3f/cMeWM/tcdgD7Th54x+39b7zhhhtKfVUAUEY8YwcAEAhhBwAQCGEHABAI\nYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQ\nCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcA\nEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEH\nABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhh\nBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABCI1PJeAJStDctWLn7ptQPY\nsejLzaW+GAAoU8KOkLVo0eLdd99dOaPgAPY99uhjvvOd75T6kgCg7MTi8Xh5rwEAgFLgGTsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgECk\nlvcCoAxt3bp11apVpTtnhQoV6tevX6GCfxQBcNiJxePx8l4DlJUrrrhi/PjxpT7t448/fs01\n15T6tABwkFyxI2SbN28+6dx2LXp2LcU5Z9z10ObNm0txQgAoLcKOwKVXrnRUnVqlOGFKmv9q\nADhMeU4IACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\n7tshPz8/FostXbq0dKft2bNnLBb75JNPSnfa4lJTU1u3bl128wMAScKu1EyYMCEWi1WsWPHf\n//737q8ef/zxubm5JZ/tnnvuKfWMAwDCJuxK2VdffXXttdce5CSrVq269dZbhR0AsF+EXSlr\n167dK6+8MmHChIOZZMGCBaW1HgDgyCHsStngwYMbNGgwePDgL774Yi+brVmz5rrrrmvQoEF6\nenrNmjW7deuWjLkuXbp07do1iqLOnTvHYrE5c+Yk96pQocK9996bk5OTkZFRv379X/ziF/F4\nvCRzRv99nG7t2rUdO3bMzMycOnXq7quaP3/+RRddVKNGjfT09IYNG15++eXLli1LvtqrV69Y\nLLZ58+abb765YcOGGRkZ2dnZo0ePLr6GF198sUWLFpmZmbVq1crPzy8sLCw+/1dffXX//fef\ncsopVatWrVKlSvPmze+///6dO3eW7EcLAOxDankvIDRpaWmPPPJIXl7eLbfc8utf/3qP26xb\nt65Vq1aFhYV9+/Y9+eSTV65c+dhjj7Vr127mzJnt27e/4447qlevPn78+KFDh5566qlNmzZN\n7njXXXe98847P/3pT1NSUh555JGhQ4cef/zxP/rRj/Y5ZxRF6enpURTdeOONaWlpQ4cOzcnJ\n2WVVCxcubN++ffXq1QcOHFinTp2PPvpozJgxf/3rXxcvXnzMMcckZ7jkkksaNWr0zDPP7Ny5\nc8SIEYMGDapWrdpVV10VRdHrr7+el5dXu3btoUOH1qxZs6CgIC8vr0KF//8fD/369fv973/f\nq1evfv36xWKxmTNn/uxnP1u+fPmjjz5aumcBAI5Mwq6U7dy588ILL+zatetvf/vbK6+8sk2b\nNrtvM2zYsE8//fSNN95o2bJlYqR3797NmjUbMmTIggULWrduPWvWrCiK2rRp06lTp+I7fvDB\nB/PmzUtLS4ui6Nxzz23RosUzzzyTCLu9zxlFUWKv9evXz5gxo3hsJc2fP79p06YPPPBAhw4d\nEiP16tXr37//xIkTr7/++iiKUlNToyiqXr362LFjExuMHTu2cePGU6ZMSYTd3XffvWPHjuef\nf/7000+Poig/P/+6666bPXt28hDPPvtsmzZtnn766cS311xzzaBBg1asWLFjx46UlJT9/2ED\nAP/Drdgy8cgjj1SqVOmaa67Zvn37Li/F4/HJkyc3b978uOOOW/1faWlpbdu2ffPNNzdv3ryX\naQcPHpzosyiKTj311JSUlM8++6yEc8ZisSiKfvzjH++x6qIo6tev38KFCxNVt23btqKiosTF\nwuJ3YxMzJL/OycmpVKlS4rel7Ny5c9asWY0bN05UXUKfPn2K75uWlrZ8+fK1a9cmRx588ME/\n/elPqg4ASoUrdmUiOzt7+PDhN9100+jRo2+66abiL61du3b9+vXr168/9thjd99xxYoVxe+9\n7qJJkybJr2OxWFZW1tatW/drzhNPPHEvyx4/fvwTTzyxaNGi4s/G7dKm9evXL/5tWlratm3b\noihatWrV1q1bd7nDe9JJJxX/9uc///nAgQObNGnStWvXs88++7zzzqtXr95e1gMA7BdhV1Zu\nuOGG8ePHDx8+/NJLL23QoEFyfNOmTVEU5ebmjho1ave96tatu5c5MzIy9jhe8jmrVq36TZPf\ndttto0aNatmy5ejRoxs1apSRkfHee+/l5+fvslnykuEutmzZEkVRxYoViw9WrFgxcaUwYcCA\nASeffPIjjzwyZcqU8ePHx2Kxzp07P/bYY8V/PgDAARN2ZSU1NfXxxx8/88wz+zp2dCcAABwh\nSURBVPfvP3Xq1OQN0CpVqiS+2OX5uYNx8HMWFRU99NBD2dnZr732WlZWVmJw48aNJZ8hMzMz\nMU/xwc2bNxf/zGwUReecc84555zz1VdfzZ49e8KECX/4wx++//3vv/fee4lPZgAAB8MzdmWo\nTZs2+fn5f/nLX/785z8nw6V27do1atRYsmTJLr8KZN26dQd8oIOfc/Xq1Vu3bm3ZsmWy6qIo\nKigoKPka6tSpk56e/vHHHxcfXLRo0R43zsjI+P73v//kk0/27dt36dKl77zzTskPBAB8E2FX\ntu69996aNWsOGDCg+IWrHj16FBUV3X///cmRdevWNW/e/MILL0x8m/gwQeL5uRLa55x7V7t2\n7VgsVvxzEu+8884f/vCHaLeLcN8kNTW1bdu2S5cuLf7L88aMGZP8eu7cufXq1UvMmZS4kPlN\nt3cBgP3iVmzZOvroo3/5y18mPkl6yimnJAaHDx8+ffr0kSNHrlq1qn379p999tnjjz++YcOG\nAQMGJDZIfAThnnvu+fjjj9u1a1f8c6bfZJ9z7l1mZuYFF1wwbdq0vn37dujQYfHixY8++ujT\nTz+dl5c3ffr0iRMn5uXl7XOSn/3sZwUFBV26dPnJT35yzDHHFBQUbNmyJflUX8uWLatXr96n\nT585c+bk5ubGYrE333zzySefPOuss/brr+gCAN/EFbsyd8UVV5x99tnFR2rVqjVv3rx+/fq9\n/PLL+fn59913X25u7pw5czp27JjYIC8v7+KLL/7nP/951113LV++vCRH2eec+zRu3LhevXpN\nmTKlb9++r7/++tSpUzt37nznnXcWFhYOGjQo8fmMvevcufPEiRNr16794IMP3nfffbVq1Xru\nueeOOuqor7/+Ooqi1NTUgoKCa6+99tVXX73ppptuvfXWhQsX3nXXXTNmzCj+AQsA4IDFdnm2\nHULSvXv3D3dsObPPZaU4559uHHpz3+sHDx5cinMCQKlwxQ4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQqeW9AChby9989z+ff1GKE365el0s\nFivFCQGgtAg7QtanT58TTjihlCc98+zOnTuX8pwAUBpi8Xi8vNcAAEAp8IwdAEAghB0AQCCE\nHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAgUst7AVCGFi1a\nNHfu3PJeBQAcIrF4PF7ea4CycvHFF0+b+VLFKlnlvRAAKHNbN37pih0hi8fjJ53b7sw+l5X3\nQgCgzL320G89YwcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAI\nYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQ\nCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcA\nEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEH\nABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhh\nBwAQCGG3f3r27BmLxVavXl2Kc6amprZu3fogJymLhe2iVNYJAJSdIyLsfvnLX8Zisccff3yP\nr2ZlZdWpU6eEU+Xm5v7gBz/IyMhIfHvPPfcsXbq0dFb5DSZMmBCLxYYPH77L+LPPPpuSknLG\nGWd8+eWXuy8MADgCHRFhV4puueWWl1566eijj46iaNWqVbfeemtZh90eTZs27fLLL//ud787\nc+bMo446apeFAQBHJmF34BYsWFAux3311Vd79OjRpEmTv/3tb0oOAEgSdv+jV69esVhs8+bN\nN998c8OGDTMyMrKzs0ePHh2PxxMbJB9l69KlS9euXaMo6ty5cywWmzNnTmKDNWvWXHfddQ0a\nNEhPT69Zs2a3bt126b8XX3yxRYsWmZmZtWrVys/PLyws3K8Vzp07t2vXrtnZ2S+//HLNmjWT\n48Wfsdvnu4iiaPr06WeccUalSpXq1KkzcODArVu3Zmdnn3baaSVf5/Lly6+66qp69eqlp6fX\nqFEjLy9v/vz5u/wkCwsLr7nmmtq1a1eqVKl169bz58/fsmXLDTfcUK9evaysrLZt27711lv7\n9fYBgL1ILe8FHF7S09OjKLrkkksaNWr0zDPP7Ny5c8SIEYMGDapWrdpVV11VfMs77rijevXq\n48ePHzp06Kmnntq0adMoitatW9eqVavCwsK+ffuefPLJK1eufOyxx9q1azdz5sz27dtHUfT6\n66/n5eXVrl176NChNWvWLCgoyMvLq1ChpHn97rvvdu7c+ZhjjnnllVeOPfbYA34Xf//737t2\n7VqzZs1bbrmlRo0akydP7tmz56ZNm+rVq5eYYZ/rXLly5RlnnLFly5Z+/fo1a9bs008/feyx\nx773ve+9/PLLZ511VnINPXr0aNeu3UsvvbRo0aK+ffv26NGjefPmzZo1mzp16rJly/Lz888/\n//yVK1empaXtx0kCAL6BsPsfqampURRVr1597NixiZGxY8c2btx4ypQpu4Rd69atZ82aFUVR\nmzZtOnXqlBgcNmzYp59++sYbb7Rs2TIx0rt372bNmg0ZMiRx3e7uu+/esWPH888/f/rpp0dR\nlJ+ff911182ePbska3v//ffPO++8ypUrv/rqq9nZ2QfzLu66664dO3b85S9/Sazzmmuu6dix\n48aNG5Mz7HOdd95559q1a6dMmXLRRRclRi666KLvfve7N9100xtvvJFcQ5MmTYYOHRpF0amn\nnvriiy9OmjTpjDPOuOeee6IoatGixezZs3/1q18tWLCgbdu2JfkJAAB751bsHvz4xz9Ofp2T\nk1OpUqVPPvlkn3vF4/HJkyc3b978uOOOW/1faWlpbdu2ffPNNzdv3rxz585Zs2Y1btw4UUsJ\nffr0KcmSli9f/v3vf3/t2rV169atW7fuQb6L2bNnn3TSScn6TElJufnmm5Mb73Od8Xj8+eef\nr127drdu3ZKD3/nOd9q0aTN37twNGzYkB7t37578ukmTJlEUJe5fJ5x44olRFK1ataokbwcA\n2Cdhtwf169cv/m1aWtq2bdv2udfatWvXr1//1ltvHfu/Zs6cGUXRihUrVq1atXXr1pycnOJ7\nnXTSSSVZ0pNPPlmtWrVrr712wYIFu1w73N93UVhYWFRUdPzxxxd/tfg1s32uc/Xq1Rs3bmzW\nrFksFiu+TSLU/v3vfydHkvd2o/9ewys+krgDW5KfLQBQEkfErdhEfxT/6EBxO3fu3OUptwN7\n5GvTpk1RFOXm5o4aNWr3V+vWrbtu3booiipWrFh8vGLFirvk0R6dd955f/7znzMzM1evXv3M\nM8+cdNJJw4YN2/su3/QuElfUKlWqVHywSpUqKSkpia+3bNmy93X+5z//iaKocuXKu8ycmZmZ\nfPWb1uBxOgAoO0dE2CV+01vxW4RJGzdu3Lp1a+PGjQ/+KFWqVEl8kXzkbhebN2+OoqioqGiX\nwW8qzuLatGmTSLGnnnrq3//+94gRI77zne9ceumlB7DORFrtsowtW7bs2LEj8XWiz/ayzqys\nrOh/Ay4hMZL8OQAAh9gRcSv21FNPjaJo2rRpuyfUCy+8EEVRq1atDv4otWvXrlGjxpIlS3b5\nzSCJC3VRFNWpUyc9Pf3jjz8u/uqiRYv26yhZWVlTp06tXr36lVdeeWC/SK9OnToVKlRYvnx5\n8cF58+YV32Dv66xTp0716tX/9a9/7fLzXLx4cSwWS9yQBQAOvSMi7Fq0aHHGGWfMmzdvxIgR\nyetSURT94x//GDJkSEpKyoABAw5g2sS9y61btyZHevToUVRUdP/99ydH1q1b17x58wsvvDCK\notTU1LZt2y5durR4kI0ZM2Z/j9uoUaNJkyZt27ata9euJflUxy7S09Nbtmy5aNGiJUuWJEZ2\n7Nhx7733JjcoyTq7d+++atWqRBYnvPPOO/Pnzz/nnHOqVau2v0sCAErFEXErNhaLTZw48eyz\nzx4xYsQzzzzTqlWrihUrLlmy5O9//3tqaupvfvOb5s2bH8C0iY8X3HPPPR9//HG7du1OP/30\n4cOHT58+feTIkatWrWrfvv1nn332+OOPb9iwIRmOP/vZzwoKCrp06fKTn/zkmGOOKSgo2LJl\nS9WqVff30Oecc86DDz44YMCAvLy82bNn7/64297ddNNNPXr0OP/886+99tqjjjpqwoQJOTk5\nxf/O7D7XOWLEiMSfNRswYMCJJ564bNmyMWPGZGVlPfjgg/v7XgCA0nJEXLGLoignJ2fRokXD\nhg2rWLHin/70pyeffHLFihVXXnnlwoULf/KTnxzYnHl5eRdffPE///nPu+66K3Fns1atWvPm\nzevXr9/LL7+cn59/33335ebmzpkzp2PHjoldOnfuPHHixNq1az/44IP33XdfrVq1nnvuuaOO\nOurrr7/e36P379//6quvfvvtty+//PKSPKVX3CWXXPK73/0uPT399ttvHzly5Pe+973f/va3\n8Xg8+fmJfa6zbt268+fP79Gjx+9///urr756zJgx55xzzrx58w4skQGAUhHb3yYgSF9++WXV\nqlXz8vKK310NQPfu3T/cseXMPpeV90IAoMy99tBvj5QrdhT3+9//vkOHDgsXLkyOPPnkk1EU\nJf4aGADwLXVEPGPHLpo2bTp37twuXbr069evbt26b7/99m9+85v69euX8M9gAACHJ2F3JGrV\nqtUrr7xy9913jxkz5osvvqhVq9YVV1zxi1/8wgdaAeBbTdgdoc4888wXX3yxvFcBAJQmz9gB\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELY\nAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC\n2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAE\nQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEA\nBELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEIrW8FwBlKCUl5b1pr7z/6pzy\nXggAlLltRV/F4vF4eS8DysrKlSvff//98l4FABwiwg4AIBCesQMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLAD\nAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISw\nAwAIRGp5LwDK0JAhQ95///26deuW90LYsy+//HLZsmXNmzcv74XwjRYsWHDKKaekp6eX90LY\nsw8//LBSpUrHHntseS+EPdu4cePXX389ZcqUQ3ZEV+wI2ezZs5ctW1beq+AbrVmz5p///Gd5\nr4JvtH379rfffruwsLC8F8I3+uCDD1asWFHeq+AbrV69+u9///uhPGIsHo8fyuPBodS9e/f6\n9es/9NBD5b0Q9mzChAm33nrrypUry3sh7NnWrVsrVao0d+7cVq1alfda2LMuXbo0bdr0vvvu\nK++FsGfjxo27++67P/zww0N2RFfsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAAC\nIewAAAIh7AAAAiHsAAACkTJ8+PDyXgOUlZSUlNzc3EaNGpX3QtizypUrV6tWrW3btuW9EPYs\nNTV127ZteXl5FStWLO+1sGcpKSktWrRo0KBBeS+EPatcufIxxxzTunXrQ3ZEfysWACAQbsUC\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELY\nAQAEQtgBAARC2AEABELYAQAEQthx2CksLLzhhhsaNmyYnp5et27d/Pz8VatWHfqjHJplfEtt\n27bt1ltvTUlJadmyZRkdoiQ//xkzZrRv375KlSrVqlU755xzZs2aVUaL+db54osvhgwZ0qBB\ng4yMjEaNGnXr1m3u3LmlfhTn6IB99NFHP/3pTxs3bpyRkVGzZs1u3brNnz+/1I/iBJWKQYMG\nxWKx/Pz8Up+5rE5QHA4nX3311WmnnRZF0cUXX3z33Xf/5Cc/SUtLa9So0eeff34oj3JolvEt\ntXjx4tNOO61KlSoVKlRo0aJFWRyiJD//cePGRVHUuHHjO+64Y8iQITVr1kxPT3/99dfLYj3f\nLhs2bGjYsGEURRdccMGdd9552WWXpaamVqxYcdGiRaV4FOfogC1ZsuSYY45JT0/v3bv3sGHD\nLrvssrS0tLS0tH/84x+leBQnqFQsWLAgJSUliqKrr766dGcuuxMk7Di8PPjgg1EU3XvvvcmR\nZ599NoqiwYMHH8BsDRo02OOO+zxK6S4jJBs3bszMzGzZsuUHH3yQkZFxkGF3wCdozZo1WVlZ\np5566ubNmxMjH3zwQVZW1rXXXnsw6wnDddddF0XRI488khx57rnnoig6//zzD2A256jUdezY\nMRaLFRQUJEemTJkSRdGll156ALM5QWVn27Ztubm5p5xyysGE3aE/QcKOw0tubm6VKlWKioqK\nDx5//PG1atXauXNn4tvVq1dfe+219evXT0tLq1GjRteuXefPn7/H2b7pv6h9HqUkyzgybdiw\nYfDgwV9//XU8Hv+msDsEJ+j++++Pouill14qvsERfmqSbrjhhnPPPTdxjhJ27tyZmZnZoEGD\n5IhzVI7uuOOOW2+9tfjI9u3b09LSTjnllOSIE3Q4uOeee2Kx2IwZM3YPu8P5BAk7DiNbt25N\nSUk599xzdxm/8soroyj68MMP4/H42rVrGzRoULVq1Ztvvnn8+PEjR4487rjjMjIyZs2atfuE\ne/wvap9HKckyiH9D2B2CExSPx3/wgx9kZmYm2qWoqGjjxo2l9q5CVFRUlJaWduaZZya+dY4O\nN5988kkURd26dUt86wQdDpYuXZqZmdmvX78vvvhil7A7zE9Q6r6fwoNDZeXKlTt27MjOzt5l\nvEGDBlEUffTRRzk5OcOGDfv000/feOON5GP7vXv3btas2ZAhQxYsWBBF0dKlS5M7bt++vbCw\nMDmSlZVVp06dfR5lx44d+1xGab3l8ByCE5STk7NkyZJGjRr93//9X//+/RNPJiUeQ0n8zyK7\n+PWvf71t27aePXsmvnWODh9btmyZP3/+wIEDq1SpcvvttycGnaDDwTXXXFOtWrVRo0bF4/Fd\nXjrMT5Cw4zCyadOmKIoqV668y3hWVlbi1Xg8Pnny5ObNmx933HGrV69OvJqWlta2bduZM2du\n3ry5YsWKTZo0Kb7v7373u9/97neJr7t27fr888/v8yj73KAU3mqgDs0JiqLo888/j6Loggsu\n6NWr14033vjpp58+8MADV111VXp6eq9evcr4XX7LFBQU3HTTTWeddVbfvn0j5+hwUq1atY0b\nN0ZR1Lt37z//+c+JfzE6QYeDJ5988pVXXvnTn/5UtWrVwsLC4i8d/idI2HHYicViu4wk/sEU\ni8XWrl27fv369evXH3vssbvvuGLFiu985zuTJ09Ojlx77bWtW7e+4oorEt/Wq1evJEcp4Qbs\n7pCdoK+//nr58uVPPfVUct8ePXqccMIJgwcP/uEPf5j4FBtRFE2cOPGqq646+eSTX3jhhdTU\n1Mg5Opz069fv888//7//+78//vGPy5Yte+qpp3Jycpygcrd27drBgwd36dLl4osv3uOrh/kJ\nEnYcRo466qhoT5fEvvzyyyiKqlSpkngpNzd31KhRu+9et27dWCx2ySWXJEeGDBlywgknFB8p\nyVH2ucEBvLUjxKE5QVEUZWVlbd++vfiOxx57bOfOnSdPnrx48eLvfve7pfaWvrXi8fjw4cN/\n/vOfd+rUadKkScn/u3WODh/JUzBr1qwuXbpcdNFFb7/9thNU7gYOHPj111+PGTNmj68e/idI\n2HEYqV+/fmpq6vLly3cZ//DDD6MoatKkSUZGRmKkU6dOZXeUOnXq7H2DAz508JL1UKYnKIqi\nhg0bvvPOO2lpacU3qFmzZuReeRRFURSPx/Pz88eNG9e/f//Ro0cX/8e9c3QY6tChQ9euXf/4\nxz++//771atXTww6QeVixowZzzzzzJ133lmhQoXEh1oSsbVly5ZPPvnkqKOOOvz/C/KXJziM\npKent2jRYv78+Vu2bEkO7ty5s6CgIDs7u379+rVr165Ro8aSJUt2eehh3bp1pXiUfW5wEG8x\ncIfmBEVR1KZNmx07drz11lvFd0w8nrz788hHoBtvvHHcuHEjR458+OGHd7ll4xyVr0//v/bu\n39W8MI4D+HM66CrFopTOZMThH7DJoPxYlJFkkMR2wyRlVwaZbFgoNhEj5S9gMF2SH4uOKHGH\npyvf3Ht9B3Eu79fm9K4nvev4nJzznI8Pk8l0+nPtZLvdEkIEQUBBj9Vutwkh6XSa+6LX6wkh\npVKJ47hMJiP+gjDYgbgEAoHNZkP376EKhcJkMjm9zsXj8Wy32/PAfD7ned7hcNxwlasB+Ml9\nCvL5fAzDJBKJ3W5HjwwGg1arxfP8K/8mUdVqNZvNRqPReDz+bQAdPZBWq12tVpVKpd/vnw4O\nh8Nms6lQKAwGA0FBDxUIBBr/KpfLhBCbzdZoNOgTqWIv6D+3RQG4j/1+b7FYCCEulyuVSnm9\nXoZhjEajIAg0MJvN6NWM3+8vFouZTIZuEdlsNm+4ytXAy+p2u+9fWJbVaDSnj4vF4nivgo7H\nYywWI4SYzeZUKhUMBuVyuUwm63Q6N//Kf45OpyOERCKR9wv0bUXo6LFqtRrLslKp1Ov1JpNJ\nn89Hn47M5XI0gIJE5XIfO5EXhMEORGe9XtP3l0ulUq1WGw6Hl8vleWA6nYZCIY7jJBKJSqVy\nOp39fv/mq1wNvKZv7xemRqMRzdynoMPhkM/nTSbT29ubUqm02+0/7fz+an65kh+PxzSDjh6r\n1+u53W61Ws2yrEqlslqt9Xr9PICCxONysDuKuyDm+OtZAAAAAAD+CtxjBwAAAPAkMNgBAAAA\nPAkMdgAAAABPAoMdAAAAwJP4BEzx6FJbTGvSAAAAAElFTkSuQmCC"
          },
          "metadata": {
            "image/png": {
              "width": 420,
              "height": 420
            }
          }
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# 5 Companies with least number of purchase\n",
        "\n",
        "bp_country_low=country_price$Country[34:38]\n",
        "bp_quantity_low=country_price$Quantity[34:38]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_quantity_low, names=bp_country_low, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "e2d9b14b-7326-4c5f-bd52-78dedb121899",
        "_cell_guid": "94a09709-00ff-4332-8b5c-d446bd412f22",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "Hu6AJovZ0fke",
        "outputId": "48d6794b-503e-40fc-fa3b-b637e0824151",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 437
        }
      },
      "execution_count": 24,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "plot without title"
            ],
            "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAACXBIWXMAABJ0AAASdAHeZh94\nAAAgAElEQVR4nO3de5xUdf348TOwF5dbgCAkILcUXdFQyL4JCip+zZCraKSgUlgQVxVT6YGh\nFWhoUt6+CuIFC0S5JoGmAQ8iEUWRchGNiz8wUUC5Cctl2d8fU9uGJASsA2+fz79mzpw58579\n9IiX58zspoqLixMAAI5+5TI9AAAAh4ewAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIO\nACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgB\nAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAASRlekBoAytXr162bJl\nmZ4ipurVq5955pmZngKAf5MqLi7O9AxQVi677LIp06Zm5eZmepBo9hQVpYr27NixI9ODAPBv\nnLEjsqKiolMvvqDltVdmepBo3ltS8OzQX2R6CgD25jN2AABBCDsAgCCEHQBAEMIOACAIYQcA\nEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAA\nghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBA\nEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAI\nQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgdxbKysv7nf/4nfbtbt26pVGrt2rWf5wDpF12z\nZs1n7/A5TwUAX1jC7lDt2bPnmWeeueSSSxo2bJiXl5eXl9e4ceMePXq88cYbn+cYzZo1u+ii\ni3Jzcz9jn8GDB6dSqapVq27fvv3ImQoAOFyE3aH6zne+c9lll/31r3+99NJLf/rTnw4ePLhJ\nkybjx49v2bLlvHnzPrcxbr755lmzZlWrVu0/7bBz587HH3+8XLlymzZtevrpp4+QqQCAwygr\n0wMc3WbPnj1x4sTWrVu/8MILWVn/+mH+7ne/69Chw4ABA15//fUMjlfapEmT1q9f/8Mf/vDB\nBx8cPXr0VVddlemJAIDDzBm7Q1JQUJAkyWWXXVa66pIkad++/bhx40aOHLlnz570loULF3bu\n3LlGjRo5OTkNGjTo0aPHqlWrSva/5JJLUqnUxo0bS7bs3r07lUq1bdu2ZMvvf//75s2b5+Xl\nHXfccb169Sq9c3IAn2Z7+OGHkyQZNGhQq1at/vSnPy1duvTTT//www8vvPDCvLy86dOnH8jY\naTt37rzhhhvq1KmTm5t78sknP/DAA/9pqgM5GgBw0JyxOyT16tVLkuQPf/jDD37wg73arnv3\n7iW3Fy1a1Lp16+rVqw8cOLB27dorVqy4//77n3/++YKCgmOPPfZAXmj+/PkdOnSoVavWrbfe\nWrNmzblz53bo0KFcuQPt8rfffnvOnDlnn332iSeeeNVVV82bN2/MmDF33313yQ45OTlJklx3\n3XXZ2dm33npro0aNDnzsAQMGbN68uV+/foWFhU8++WTfvn1zcnJ69eq11wyH/kMAAD6bsDsk\nF1988RlnnDFt2rSvfe1r3/3udy+44IJTTjkllUrttdvChQvz8/PvvvvuNm3apLfUqVOnf//+\n48eP79ev34G80M9//vOioqKpU6d+7WtfS5KkV69effv2PfDP8KVP1/Xs2TNJkm9/+9sDBw58\n4oknRowYke65JEmys7OTJFm/fv3MmTNLevEAx968efOcOXPSz/rud7970kknDR8+/NNhd+g/\nBADgs7kUe0iys7PnzJnTt2/fZcuWDRgw4NRTT61Zs2bnzp3Hjh27bdu2kt369OmzaNGidNDs\n2rWrsLAwPz8/SZIDvBC5Z8+eOXPmNG7cOF11addee+0BDrljx47HH388Ly/v8ssvT5KkcuXK\nl1566fr166dMmVKyTzpGr7766tJnAQ9w7N69e5c8q379+i1btly5cuXq1av3GuMQfwgAwH4J\nu0NVpUqV++67b926ddOnT7/pppuaNGkyY8aM733vew0aNHjhhRdKdhs3blzr1q2rVauWk5OT\nl5d3wQUXJEmye/fuA3mJ999/f/v27enLoyVOPvnkA5ww/bWJSy+9tEqVKukt6VN3Y8aM2WvP\nJk2a7LXlQMY+/fTTS99Nz/nuu+9+epJD+SEAAPsl7A6PihUrtm/f/o477pg/f/4HH3zw61//\nevPmzV27dl2/fn2SJEOGDLnqqqu2bdt2zz33zJkz56WXXvp0VH2G9Mm/Y445pvTGY4455tPX\nfPcpfR22TZs2f/ununXr1qpV68UXX1yxYkXpPb/0pS+VvnuAY5f0YlqFChWSJCksLNxrt0P8\nIQAA++UzdodftWrV+vfv/+677959991z585t167dqFGj6tWrN3v27EqVKqX32bRp02cfZOfO\nnSW38/Lykk+l0tatW4uLi/c7zLJly+bOnZskyac/9JYkySOPPPLzn/98n08sLCw8wLH3+nXH\n6QxN591BHA0AOGjC7uAVFRX169dvzZo106ZN+/QXVKtWrZokydatW9euXbt9+/YWLVqUBE2S\nJOnYKpH+7sKuXbtKtqxcubLkdu3atXNyckpvSZJkyZIlBzJk+nRdr169LrrootLbCwsLr7nm\nmkcfffS2227b6/u8aQcydtrSpUtLX8Ndvnx58s8LsgdxNADgoAm7g1e+fPmVK1c+99xzt9xy\ny/Dhw8uXL1/y0PLlyx966KGsrKw2bdocd9xxqVSq9FcEFi9e/MQTTySlTsJ9+ctfTpJk6dKl\nNWvWTG9J75CWlZV19tlnz5kz55VXXin5/sT999+/3wnTX5vIzc0dPnx4yZFLTJ06ddKkSTNm\nzOjYseOnn1urVq39jp02duzYTp06pW+vWbPmz3/+c35+fu3atQ/uaADAQfMZu0MyevToRo0a\n/eIXv2jYsGGfPn2GDRs2ePDg9u3b5+fnv/feeyNHjqxfv35eXl67du1ef/313r17T5gw4dZb\nbz3//PNHjx6dlZU1Y8aM8ePHf/LJJ+m/A3H99dfPnj375ZdfHjJkyEsvvVS5cuWSF/rRj36U\nSqUuueSSW2655a677mrfvv3atWv3+kjcp02aNGnDhg1XXHHFp6suSZL+/fun38I+n3sgY6f3\n3LFjR+fOnR9++OFRo0b97//+786dO4cOHXrQRwMADpqwOyT16tVbvHjxHXfcUa9evYkTJ/7s\nZz974IEH3n777e7duy9cuHDQoEHp3caOHXvFFVdMnjy5d+/e8+fPnz59+sUXXzx06NCNGzde\nf/31W7Zs+Z//+Z/HHnts+/bt7dq169ix44YNG373u99Vrlx5x44d6SNcfPHF48ePr1Wr1i9/\n+ctf/OIXxx133KRJk6pUqVL6o3if9tBDDyVJMnDgwH0+2rp169NOO23WrFlr1qzZ5w77HTt9\nsm3ChAkNGjQYNmzYTTfdlCTJo48+2q1bt4M42oH+0AGA/yB1IB/Ah6NUly5dlhdta3ntlZke\nJJr3lhQ8O/QXRUVFmR4EgH/jjB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7\nAIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEH\nABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewA\nAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0A\nQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMA\nCELYAQAEIewAAILIyvQAUIZSqdRbL85btfD1TA8Sze6dO8uV85+FAEecVHFxcaZngLKyZMmS\nBQsWZHqKmL785S+3b98+01MA8G+EHQBAEC6mAAAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAg\nCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAE\nIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgiKxMDwBlaObMmXPnzs30FAAHpGXLlu3bt8/0FBzd\nUsXFxZmeAcpKly5d/vjySzUanZDpQQD2Y8PK1Wd/9YwZM2ZkehCObs7YEVz9Fl9tee2VmZ4C\nYD8WPPZUst2pFg6Vz9gBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgB\nAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsA\ngCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcA\nEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAA\nghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBA\nEMKOJEmSXr16pVKpv/3tb4f3sN26dUulUmvXrj28hwUA9knYHd2efPLJVCnlypWrWbNms2bN\nfvSjH23YsCHT0yXNmjW76KKLcnNzMz0IAHwhZGV6AA6Dli1btmrVKkmS4uLiDRs2zJ49e+TI\nkdOmTXvttdcqVqyYwcFuvvnmm2++OYMDAMAXirCLoG3btsOGDSu5W1RUdNFFF7344otTpkzp\n3r175uYCAD5XLsUGVL58+UsuuSRJknXr1pVsXLhwYefOnWvUqJGTk9OgQYMePXqsWrVqryeW\nK1fuzjvvbNSoUW5u7gknnPDTn/60uLg4/VD603IffvjhhRdemJeXN3369AM5bOnP2F1xxRWp\nVGrr1q033XRTgwYNcnNz69Wrd88995S8BABwiJyxi6mgoCBJkubNm6fvLlq0qHXr1tWrVx84\ncGDt2rVXrFhx//33P//88wUFBccee2zJs372s58tXrz4+9//fvny5e+9995bb731K1/5yne+\n850kSXJycpIkue6667Kzs2+99dZGjRod+GHT0kfo2rVrw4YNJ0yYsGfPnttuu+3666+vWrVq\nz549P5efCgAEJ+wi+Oijj0q+0Prxxx9PmjTpkUceueaaa84999z0xoULF+bn5999991t2rRJ\nb6lTp07//v3Hjx/fr1+/kuO88847L7/8cnZ2dpIkF1xwQfPmzSdMmJAOu/TG9evXz5w5s1y5\ncv/VYdOysrKSJKlevfqDDz6Y3vLggw82btx48uTJwg4ADgthF8G999577733ltxNpVK9e/e+\n4447Srb06dOnT58+6du7du0qKirKz89PkmSvq7E33HBDOuCSJDnjjDPKly//97//veSYSZJc\nffXVJVV34Ict7eqrry653ahRowoVKqxZs+a/fsMAwL4Iuwguu+yyyy+/PH178+bNb7311mOP\nPTZlypSJEyeec8456e3jxo0bM2bMkiVLNm7cWPLE3bt3lz7OiSeeWHI7lUpVqlRp+/btpXdo\n0qTJXi99IIct7YQTTih9Nzs7e9euXQfyHgGA/RJ2EeTn53ft2rX0lr59+55xxhlXXnnlO++8\nk5ubO2TIkBEjRrRo0eKee+5p2LBhbm7um2++2atXr72Os99fOPelL32p9N0DPGxpJWcEAYDD\nTtjFVL9+/fPPP3/SpElvvvlmfn7+qFGj6tWrN3v27EqVKqV32LRp0yG+RGFhYVkcFgA4aH7d\nSVhbtmxJkqSwsHDt2rXbt29v0aJFSX4lSTJ37txDPH4ZHRYAOGjO2MX06quvzps3r1KlSl/9\n6lfLlSuXSqVKf6Fh8eLFTzzxRJIkhYWFB/0StWrVKovDAgAHTdhF8MILL5S01I4dO5YvXz5r\n1qyioqKxY8em/6RYu3btnn322d69e7dp06agoOC+++77zW9+06FDhxkzZowfP75Dhw4H8aJ5\neXllcVgA4KAJuwjmz58/f/789O1jjjmmbt26nTp1GjRo0Nlnn53eOHbs2EGDBk2ePHnChAnN\nmzefPn16q1athg4dOnLkyOuvv/688847uNcto8MCAAcn5Q86EViXLl2WF21ree2VmR4EYD8W\nPPbUl7cXz5gxI9ODcHTz5QkAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAI\nYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh\n7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCE\nHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISw\nAwAIQtgBAASRlekBoGzt/GTb5rUfZnoKgP3Y8cm2pFxepqfgqCfsiKxSpUpvTZny1ovzMj0I\nwP41vfzyTI/AUS9VXFyc6RmgrGzfvv3999/P9BQAB6R27doVKlTI9BQc3YQdAEAQvjwBABCE\nsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQ\ndgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAgsjI9AJSh\nn//852PHjs30FADEkZ2d/cwzzzRt2jTTg+ybsCOyRYsW7ah0zFfO+XqmBwEgiD+NfnLlypXC\nDjLj2Ab18r95XqanACCIP48dn+kRPovP2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhh\nBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHs\nAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQd\nAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLAD\nAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYA\nAEEIOwCAIIQdAEAQwg4AIAhhx96efPLJ1Kfk5uY2atTo2muvXblyZemd9+zZ88wzz1xyySUN\nGzbMy8vLy8tr3Lhxjx493njjjX0efPDgwalUqmrVqtu3b/9c3g0AfIFkZXoAjlAtW7Zs1apV\nyd2PP/74lVdeGTNmzNNPP/2nP/2padOm6e3f+c53Jk6cWL9+/a5du9auXXvTpk2LFi0aP378\nlClTZs6cec4555Q+5s6dOx9//PFy5cpt2rTp6aefvuqqqz7XtwQA0Qk79q1t27bDhg3ba+Nd\nd9114403DhkyZPr06UmSzJ49e+LEia1bt37hhReysv71v6Xf/e53HTp0GDBgwOuvv1766ZMm\nTVq/fv0Pf/jDBx98cPTo0cIOAA4vl2L5LwwYMCAnJ2f+/PnpuwUFBUmSXHbZZaWrLkmS9u3b\njxs3buTIkXv27Cm9/eGHH06SZNCgQa1atfrTn/60dOnSz2twAPhCEHb8F4qLi/fs2VOxYsX0\n3Xr16iVJ8oc//GH37t177dm9e/e2bduWK/ev/4G9/fbbc+bMOfvss0888cT0uboxY8Z8XoMD\nwBeCsOO/cOedd+7evfvCCy9M37344ovPOOOMadOmfe1rX7v33nsLCgqKi4v/03PTp+t69uyZ\nJMm3v/3tChUqPPHEEzt37vx8JgeALwKfsWPf5syZU/ozdhs3bnz55ZcXLFjwla985fbbb09v\nzM7OnjNnzpAhQ8aOHTtgwIAkSY499thzzjmnffv23bp1q1ChQsnTd+zY8fjjj+fl5V1++eVJ\nklSuXPnSSy8dN27clClTvv3tb3+ubwwA4hJ27NvcuXPnzp1bestxxx03ZMiQG264oXr16iUb\nq1Spct999915551//OMf58+fP2/evBkzZkydOvXmm2/+7W9/27Zt2/Ru6a9NdO/evUqVKukt\nPXv2HDdu3JgxY4QdABwuLsWybz/5yU+K/2nbtm0NGjTYvn17nz59SlddiYoVK7Zv3/6OO+6Y\nP3/+Bx988Otf/3rz5s1du3Zdv359eof0ddg2bdr87Z/q1q1bq1atF198ccWKFZ/rGwOAuIQd\n+5eXlzdq1KgtW7b0799/vztXq1atf//+/fr127RpU/qc37Jly9I3evXqdeI/nXTSSR988EFx\ncfEjjzxS5m8AAL4YXIrlgHTs2PHiiy+eOnXq1KlTO3XqlCRJUVFRv3791qxZM23atNLffk2r\nWrVqkiRbt25N/nm6rlevXhdddFHpfQoLC6+55ppHH330tttu2+sXpgAAB8G/phyoX/3qV3/8\n4x/79+9/wQUXVK5cuXz58itXrnzuueduueWW4cOHly9fvmTP5cuXP/TQQ1lZWW3atEl/bSI3\nN3f48OE1a9bc65hTp06dNGnSjBkzOnbs+Pm+GwAIyKVYDtSJJ554ww03rFmz5sc//nF6y+jR\noxs1avSLX/yiYcOGffr0GTZs2ODBg9u3b5+fn//ee++NHDmyfv36kyZN2rBhwxVXXPHpqkuS\nJH1td/To0Z/rOwGAoJyx47/w4x//eNy4cffff3/37t3POuusevXqLV68+IEHHpg+ffrEiRM3\nbdqUk5NTr1697t279+nTp0WLFkmSPPTQQ0mSDBw4cJ8HbN269WmnnTZr1qw1a9bUrVv3c30z\nABBO6jN+oywc7bp06bK8aFvLa6/M9CAABDHm8u9Pempi+/btMz3IvrkUCwAQhLADAAhC2AEA\nBCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCA\nIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQ\nhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACC\nEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQ\nwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAILIyPQCUrQ2rVhfMmp3pKQAIYk9R\nUaZH+CzCjsiaN2/+xhtvrJ45N9ODABDEVxo2atiwYaan+I9SxcXFmZ4BAIDDwGfsAACCEHYA\nAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4A\nIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQRFamB4AytH37\n9vfffz/TUwAQWSqVOuGEE8qXL5/pQZIkSVLFxcWZngHKylVXXTVu3LhMTwFAcA888ECfPn0y\nPUWSOGNHbFu3bj35gnOad+uY6UEACGvWz3+1devWTE/xD8KO4HIqVqhS+7hMTwFAWOWzszM9\nwr/48gQAQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEH\nABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewA\nAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0A\nQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMA\nCELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIez4vHXr1i2V\nSq1du7bk9po1azI9FABEIOy+oJ588slUKeXKlatZs2azZs1+9KMfbdiwoUxfulmzZhdddFFu\nbm6ZvgoAfAFlZXoAMqlly5atWrVKkqS4uHjDhg2zZ88eOXLktGnTXnvttYoVK5bRi9588803\n33xzGR0cAL7IhN0XWtu2bYcNG1Zyt6io6KKLLnrxxRenTJnSvXv3zM0FABwMl2L5l/Lly19y\nySVJkqxbty69Jf0ZuA8//PDCCy/My8ubPn16evvChQs7d+5co0aNnJycBg0a9OjRY9WqVemH\nVq1aldqXGjVqlD5m+jN2AMBh5Iwd/6agoCBJkubNm6fv5uTkJEly3XXXZWdn33rrrY0aNUqS\nZNGiRa1bt65evfrAgQNr1669YsWK+++///nnny8oKDj22GNr1KgxevTo0sd844037rvvvpNP\nPvlzfzcA8MUi7L7QPvroo7/97W/p2x9//PGkSZMeeeSRa6655txzz01vzM7OTpJk/fr1M2fO\nLFfuH+d3Fy5cmJ+ff/fdd7dp0ya9pU6dOv379x8/fny/fv0qVarUq1evkpf4+OOPR4wYUaNG\njd/+9ref2/sCgC8mYfeFdu+99957770ld1OpVO/eve+4447SW5Ikufrqq0uqLkmSPn369OnT\nJ317165dRUVF+fn5SZKUXI0tUVxc3L1793ffffe555474YQTyux9AABJIuy+4C677LLLL788\nfXvz5s1vvfXWY489NmXKlIkTJ55zzjkluzVp0mSvJ44bN27MmDFLlizZuHFjya4+ZaAAABPM\n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\nHCKXYo96xcXFTz/99Omnn163bt21/5SdnX322We/+uqrW7duLdmzd+/e6apLkqR+/fotW7Zc\nuXLl6tWrkyTp06fPokWL0lW3a9euwsLC/Pz8JElKX41NkuTqq68uud2oUaMKFSqkf4VKcXHx\n1KlTa9Wq1alTp5IdTjnllG984xsLFizYsGHDfo8AABw6YXfU+/DDD9evX//aa699+d8999xz\nSZL8v//3/0r2PP3000s/sVGjRkmSvPvuu+m748aNa926dbVq1XJycvLy8i644IIkSXbv3l36\nKSeccELpu9nZ2bt27UqSZO3atZs2bTr11FNTqVTpHZo0aZIkydtvv73fIwAAh86l2KPeli1b\nkiRp1qzZiBEjPv3o8ccfX3K7SpUqpR+qUKFCkiSFhYVJkgwZMmTEiBEtWrS45557GjZsmJub\n++abb6av0paWnZ29zxk++eSTJEkqVqy41/a8vLySRz/7CADAoRN2R73KlSunb3zzm9/87D23\nb99e+u62bduSJKlQoUJhYeGoUaPq1as3e/bsSpUqpR/dtGnTgc+QflbpgEtLbymZEAAoUy7F\nHvVq1apVo0aNt956a+PGjaW3r1u3bq89ly5dWvru8uXLkyRp1KjR2rVrt2/f3qJFi5KqS5Jk\n7ty5Bz5D7dq1q1evvnTp0r1+d0lBQUEqlUpfkAUAypqwi+Cyyy4rLCwcOXJkyZZ169adfvrp\n7du3L73b2LFjS26vWbPmz3/+c35+fu3atWvVqpVKpUp/T2Lx4sVPPPFE8s8LtQeiS5cu77//\n/rRp00ofZOHCheeff37VqlUP6m0BAP8dl2KPGrNmzdrrnFySJB07djzvvPOGDRs2Y8aM4cOH\nv//++61bt/773//+f//3fxs2bBgwYEDpnXfs2NG5c+eLL75427ZtDz/88M6dO4cOHZokSV5e\nXrt27Z599tnevXu3adOmoKDgvvvu+81vftOhQ4cZM2aMHz++Q4cO+x3vtttue/bZZ3v06DFg\nwIAmTZqsWrXq/vvvr1Sp0i9/+cvD+EMAAD6DsDtqvPzyyy+//PJeG+vWrXveeecdd9xxL7/8\n8u233/7ss8+OGzeuUqVK55577tNPP33WWWeld0ufeJswYcLtt98+bNiwDRs2NG7c+NFHH+3W\nrVt6h7Fjxw4aNGjy5MkTJkxo3rz59OnTW7VqNXTo0JEjR15//fXnnXfefsc7/vjjFy5c+JOf\n/OTRRx9dt25d9erVzz///FtvvfWUU045rD8GAOA/SvmDTgTWpUuX5UXbWl57ZaYHAYAyN3vU\naJ+xAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAA\nghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBA\nEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAI\nQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACCI\nrEwPAGWofPnybz774rI//inTgwBAmdtVuCNVXFyc6TGgrKxevXrZsmWZngIAPifCDgAgCJ+x\nAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2\nAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIO\nACAIYQcAEISwAwAIQtgBAASRlekBoAwNHjx42bJlxx9/fKYH4TB46623atSoUaNGjUwPwmGw\nZMmSBg0aVKlSJdODcBi89tprjz76aNOmTTM9CEnijB2xzZs3b9WqVZmegsPjrbfeWrNmTaan\n4PD461//unbt2kxPweHx2muvFRQUZHoK/sEZOyKrU6fOCSecMGrUqEwPwmGwZMmSjh073nzz\nzZkehMNg1qxZPXv2vOqqqzI9CIfBo48+Wq1atUxPwT84YwcAEISwAwAIQtgBAAQh7AAAghB2\nAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIovywYcMyPQOUlfLlyzdr1qxhw4aZHoTDIJVK\ntWzZ8vjjj8/0IBwGxcXFbdu2rV69eqYH4TDYs2dPu3btKlWqlOlBSJIkSRUXF2d6BgAADgOX\nYgEAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCE\nHQBAEMIOACAIYQcAEISwAwAIQtgR0MaNGwcNGtSgQYOcnJzjjz++V69e77//fqaH4j/atWvX\nLbfcUr58+RYtWnz60f2upuU+cnz88ceDBw+uX79+bm5uw4YNO3XqtGDBgtI7WM2jyIoVK77/\n/e83btw4Nze3Zs2anTp1WrhwYekdrOaRKVVcXJzpGeBw2rlz5ze+8Y3XXnvt0ksvPfPMM5cv\nXz5u3Li6desuWrSoWrVqmZ6OvS1durR79+7vvPPOJ598csYZZ7z66qulH93valruI8dHH33U\nvHnzVatWtWvX7swzz1yxYsVTTz2VlZW1cOHC0047LbGaR5Vly5a1bNlyy5Ytl19+eePGjf/2\nt79NnDgxSZK5c+d+4xvfSKzmkawYYvnlL3+ZJMmdd95ZsuWpp55KkuSGG27I4FTs06ZNm/Ly\n8lq0aPHOO+/k5uY2b958rx32u5qW+8jRt2/fJEnuvffeki2TJk1KkuRb3/pW+q7VPIpceOGF\nqVRq7ty5JVsmT56cJMnll1+evms1j1jO2BHNGWecsXz58nXr1uXm5pZsPPHEEzdv3rx27dpU\nKpXB2djLRx99NHz48BEjRmRnZx9zzDFNmzbd64zdflfTch85rrvuur/85S8zZ87Mzs5Obyku\nLq5YseJxxx23atWqxGoeVYYOHVpUVDR8+PCSLUVFRXl5efn5+YsXL06s5hHMZ+wIpbCw8C9/\n+ctZZ51V+v9KkiRp1arVhx9+uHLlykwNxj5Vr179rrvuKumAvex3NS33EeWee+554YUXSq/m\nzp07d+/eXbdu3cRqHm1++tOflq66JEnWrl27a9euhg0bJlbzyCbsCGX16tVFRUX16tXba3v9\n+vWTJFmxYkUmhuIg7Xc1LfcR7qGHHtq1a1e3bt0Sq3k027Zt25w5c771rW9Vrlz5xz/+cWI1\nj2zCjlC2bNmSJEnFihX32l6pUqWSRzla7Hc1LfeRbO7cuTfeeGOrVq169+6dWM2jVtWqVStW\nrHjeeeedfvrpixcvTn913WoeybIyPQAcfp/+9Eb6s6Q+1XE02u9qWu4j0Pjx43v27Nm0adNp\n06ZlZf3rHxqredTp06fPRx999Ne//vW3v/3tqlWrHn/88UaNGqUfsppHJmFHKFWqVEn29Z+D\nmzdvTpKkcuXKGZiJg7Xf1bTcR6Di4uJhw4bdfvvt3/zmNydOnFiyClbzKDVixIj0jTlz5lxy\nySWdO3d+/fXXreaRzKVYQjnhhBOysrLefffdvbYvX748SZITTzwxE0NxkPa7mpb7SFNcXNyr\nV6/bb7+9f//+zz77bOl/v63m0a5NmzYdO3ZcsmTJsmXLrOYRLUO/ZgXKyte//vUKFSp88skn\nJVuKioqOP/74evXqZXAq9mufv8duv6tpuY8oAwcOTJJk+PDh+3zUah4t1qxZc/rpp/fo0WOv\n7V26dEmS5JVXXim2mkcwZ+yI5nvf+962bdtGjhxZsuXhhx/++9//3qtXrwxOxcHZ72pa7iPH\n5MmTf/WrXw0cOPCWW27Z5w5W82hRp06djz766Kmnnnr55ZdLNr799tvPP/98pUqVmjZtmljN\nI5hfUEw0RUVF55133rx58zp27HjmmWcuXbr0qaeeatq06YIFCypUqJDp6fg3c+fOnTlzZvr2\nXXfdVbNmzauvvjp998Ybbzz22GP3u5qW+8jxla98Zfny5f379//0T/6mm26qVq2a1TyKTJ06\ntWvXruXKlbv00ksbN2783nvvPf3005988sl9992X/hMjVvPIlelThnD4bdmyJf2XyLOzs+vU\nqdO3b98NGzZkeij2oeRz2Z/2zjvvpPfZ72pa7iPEZ/xDs3LlyvQ+VvMosmDBgk6dOtWsWbN8\n+fJVq1Zt27bt9OnTS+9gNY9MztgBAAThM3YAAEEIOwCAIIQdAEAQwg4AIIj/D/qHKP5bJ0OX\nAAAAAElFTkSuQmCC"
          },
          "metadata": {
            "image/png": {
              "width": 420,
              "height": 420
            }
          }
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Adding year feature to the dataset\n",
        "\n",
        "timest <- as.POSIXct(new_df$InvoiceDate, format = \"%m/%d/%Y %H:%M:%S\")\n",
        "timest=format(timest, format=\"%Y\")\n",
        "new_df$Year = timest\n",
        "\n",
        "head(new_df)"
      ],
      "metadata": {
        "_uuid": "d28c52b1-aeb1-4a3d-af70-71e87a785cb2",
        "_cell_guid": "52bc105e-6cc1-43af-ac7a-2f5f4edbba2c",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "T8NZgt6q0fke",
        "outputId": "d751aed8-92c2-4028-bef0-bfb2b450bb07",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 286
        }
      },
      "execution_count": 25,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 6 × 8</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>CustomerID</th><th scope=col>InvoiceNo</th><th scope=col>StockCode</th><th scope=col>Quantity</th><th scope=col>TotalAmount</th><th scope=col>InvoiceDate</th><th scope=col>Country</th><th scope=col>Year</th></tr>\n",
              "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>17850</td><td>536365</td><td>85123A</td><td>6</td><td>15.30</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>71053 </td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84406B</td><td>8</td><td>22.00</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029G</td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029E</td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>22752 </td><td>2</td><td>15.30</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 6 × 8\n\n| CustomerID &lt;dbl&gt; | InvoiceNo &lt;chr&gt; | StockCode &lt;chr&gt; | Quantity &lt;dbl&gt; | TotalAmount &lt;dbl&gt; | InvoiceDate &lt;dttm&gt; | Country &lt;chr&gt; | Year &lt;chr&gt; |\n|---|---|---|---|---|---|---|---|\n| 17850 | 536365 | 85123A | 6 | 15.30 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 71053  | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 84406B | 8 | 22.00 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 84029G | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 84029E | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 22752  | 2 | 15.30 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n\n",
            "text/latex": "A tibble: 6 × 8\n\\begin{tabular}{llllllll}\n CustomerID & InvoiceNo & StockCode & Quantity & TotalAmount & InvoiceDate & Country & Year\\\\\n <dbl> & <chr> & <chr> & <dbl> & <dbl> & <dttm> & <chr> & <chr>\\\\\n\\hline\n\t 17850 & 536365 & 85123A & 6 & 15.30 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 71053  & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 84406B & 8 & 22.00 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 84029G & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 84029E & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 22752  & 2 & 15.30 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\\end{tabular}\n",
            "text/plain": [
              "  CustomerID InvoiceNo StockCode Quantity TotalAmount InvoiceDate        \n",
              "1 17850      536365    85123A    6        15.30       2010-12-01 08:26:00\n",
              "2 17850      536365    71053     6        20.34       2010-12-01 08:26:00\n",
              "3 17850      536365    84406B    8        22.00       2010-12-01 08:26:00\n",
              "4 17850      536365    84029G    6        20.34       2010-12-01 08:26:00\n",
              "5 17850      536365    84029E    6        20.34       2010-12-01 08:26:00\n",
              "6 17850      536365    22752     2        15.30       2010-12-01 08:26:00\n",
              "  Country        Year\n",
              "1 United Kingdom 2010\n",
              "2 United Kingdom 2010\n",
              "3 United Kingdom 2010\n",
              "4 United Kingdom 2010\n",
              "5 United Kingdom 2010\n",
              "6 United Kingdom 2010"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Plot of Total Amount of sale vs Year\n",
        "\n",
        "year_ttlamount = new_df %>%\n",
        "  group_by(Year) %>%\n",
        "  summarise(TotalAmount = sum(TotalAmount))\n",
        "\n",
        "bp_yearttl_Year=year_ttlamount$Year\n",
        "bp_yearttl_TotalAmount=year_ttlamount$TotalAmount\n",
        "par(mar=c(2, 5, 0, 0))\n",
        "barplot(height=bp_yearttl_TotalAmount, names=bp_yearttl_Year, col=\"#69b3a2\")"
      ],
      "metadata": {
        "_uuid": "263c9990-cd17-41d0-997a-3e1dee43a5d7",
        "_cell_guid": "56567b4a-8ca5-4de5-816b-ac6246d1deb1",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "6LFH30-R0fke",
        "outputId": "3a93a1cc-5eb1-46e6-d98e-9dd1a15d7f5e",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 437
        }
      },
      "execution_count": 26,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "plot without title"
            ],
            "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAMAAADKOT/pAAACqVBMVEUAAAABAQECAgIDAwMD\nBQQEBAQEBgYEBwYFBQUGBgYHBwcHDQsICAgIDQwJCQkKCgoLCwsMDAwNDQ0ODg4QEBARERES\nEhITExMUFBQVFRUWFhYXFxcYGBgZGRkaGhobGxscHBwdHR0eHh4eMy4fHx8gICAhISEiIiIj\nIyMjOzUkJCQlJSUoQz0oRD4pKSkqKioqSEEtLS0uLi4vLy8wMDAxVEwyMjIzMzM0NDQ1NTU2\nNjY3Nzc4ODg4X1Y5OTk6Ojo7Ozs8PDw9PT0/Pz9AQEBBQUFCQkJDQ0NERERFRUVGRkZHR0dI\nSEhJSUlKSkpKfnJLS0tLf3NNTU1OTk5PT09TU1NUVFRVVVVWVlZXV1dYWFhZWVlaWlpbW1tc\nXFxeXl5fX19gYGBhYWFiYmJjY2NlZWVmZmZpaWlps6Jqampra2tsbGxtbW1ubm5vb29wcHBx\ncXFycnJzc3N0dHR3d3d4eHh5eXl6enp7e3t8fHx9fX1+fn5/f3+AgICBgYGCgoKDg4OEhISF\nhYWGhoaHh4eIiIiJiYmKioqLi4uOjo6RkZGTk5OVlZWXl5eZmZmampqbm5udnZ2fn5+goKCh\noaGioqKjo6OkpKSmpqaoqKipqamqqqqrq6usrKytra2urq6vr6+wsLCzs7O1tbW2tra3t7e4\nuLi5ubm7u7u8vLy9vb2+vr6/v7/AwMDBwcHExMTFxcXGxsbHx8fIyMjJycnLy8vMzMzNzc3R\n0dHS0tLT09PU1NTV1dXW1tbX19fY2Nja2trb29vc3Nzd3d3f39/h4eHi4uLj4+Pk5OTm5ubn\n5+fo6Ojp6enq6urr6+vs7Ozt7e3u7u7v7+/w8PDx8fHy8vLz8/P09PT19fX29vb39/f4+Pj5\n+fn6+vr7+/v8/Pz9/f3+/v7////638qcAAAACXBIWXMAABJ0AAASdAHeZh94AAAfFElEQVR4\nnO3d/XtcZX7f8VuobiSV+kHgNRhjsDJ207op3UqV2y4thDiwxOmWqmqBpUkwGFybxVtktzxD\nCyQ2hAIlBNLi2Ckt4aFATUxQCNkElRTqB5qVCWCQbVXnL+loJCrH/vgMH/voq9uT9+uHo9uj\n73XENXO9kaxze04q8BfXrr/0t/HN/eSCUz+VKe5VQ3Z2/ZV/hW/unxISJEKyEBI0QrIQEjRC\nshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0\nQrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshAS\nNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQ\nEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKy\nEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRC\nsoSHNP7eno9m47yoGCFZAkPas7l+eP6ilFLvW9WeGbOAkCxxIb3RuWii2JkWXb/p2nO63q30\n1JgFhGSJC2nt0pGiWFXbV1/unT9Q6akxCwjJEhfSeVuL4tP0RGN92/mVnhqzgJAscSEtvK8o\nxtp2NdYPnVvpqTELCMkSF9KVqw8XxRVbJ5djvb2VnhqzgJAscSG9lPpfOTZ88XOHj+69Oj1V\n6akxCwjJEvjr72cWpvmX1VJ7e2q7a6LaU6N6hGSJvCB7YMe6WnfXkjV3Dld8YswCQrKwRQga\nIVlCQ5r48NXdu19nh9BZgZAsgSGNDi1NDT0Pf1ntmTELCMkSF9K+VWn1+ge2b7/3puWpd7TS\nU2MWEJIlLqQNHS9Or8afbNtS6akxCwjJEhfSsltn1jeuqPTUmAWEZIkLqeORmfWDnZWeGrOA\nkCxxIdVumFkPrqz01JgFhGSJC2lL246xqdUX96dtlZ4as4CQLHEhHepP3desv2PzzWsXpKs+\nr/TUmAWEZAm8jnTk8b72yctIHZc/PV7tmTELCMkSu0Xoqw+Gh0eOVH5azAJCsrDXDhohWYJD\n2j/4dvUnxWwgJEtwSCNpZ/UnxWwgJAshQSMkCyFBIyRLZEhDQ0Mb0kD9OHTy5165fcb3Hq34\nC+M0EJIlMqRarXZJurB+rJ38ud3Xz1h5dcVfGKeBkCw5/mi3fn31XxguQrIQEjRCshASNEKy\nEBI0QrJEbxE69g3eGpKQckBIluiQPnv/UNMZQsoBIVliQ3pzTUovF8XAa6VThJQDQrKEhvRO\nZ/e6ekifLOssvWMfIeWAkCyhIV3X8/H+ye9IB3sGy8YIKQeEZAkNacljRSOk4tHFZWOElANC\nsoSGNO+F6ZCe7SgbI6QcEJIlNKRL75kO6Rax224GIeWAkCyhId2+eHgypNG706ayMULKASFZ\nQkPav2Jef+rr60o9B8rGCCkHhGSJvY50cOOSlNIFGw+WThFSDgjJEr2zYeLASOl3o0mElANC\nssS/HdfR998dK58gpBwQkiUwpNfXrvzHe4vfWZ7SeU+WDhJSDgjJEhfS2/PSeecsfPu8Fb98\nw+LG78BPiZByQEiWuJAGlv1+8cnP9fR+WRSjK3+hbJKQckBIlriQlvy7+uH30q9Prv/9t8om\nCSkHhGSJC2neb9QP+9J/nVz/x3llk4SUA0KyxIV00QP1w5vpicn13ReVTRJSDgjJEhfS97/1\n34+89+2/1fO/i+JHi/9F2SQh5YCQLHEh/VF3SulbP6ot+Ll/NK/9nbJJQsoBIVkCryP9wU3f\nWf/HxR/8g7b01/5L6SAh5YCQLHNwo7HPP2kyQEg5ICRLjnfsI6QcEJKFkKARkoWQoBGShZCg\nEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQ\noBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKF\nkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGS\nhZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKAR\nkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCg\nEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQ\noBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKF\nkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGS\nhZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKAR\nkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCg\nEZKFkKARkoWQoBGShZCgEZKFkKARkoWQoBGShZCgEZIlPKTx9/Z81GSEkHJASJbAkPZsrh+e\nvyil1PtW6SAh5YCQLHEhvdG5aKLYmRZdv+nac7reLZskpBwQkiUupLVLR4piVW1ffbl3/kDZ\nJCHlgJAscSGdt7UoPk1PNNa3nV82SUg5ICRLXEgL7yuKsbZdjfVD55ZNElIOCMkSF9KVqw8X\nxRVbJ5djvb1lk4SUA0KyxIX0Uup/5djwxc8dPrr36vRU2SQh5YCQLIG//n5mYZp/WS21t6e2\nuybKBgkpB4Rkibwge2DHulp315I1dw6XzxFSDgjJwhYhaIRkCQ1p4sNXd+9+vdkOIULKAiFZ\nAkMaHVqaGnoe/rJ0kJByQEiWuJD2rUqr1z+wffu9Ny1PvaNlk4SUA0KyxIW0oePF6dX4k21b\nyiYJKQeEZIkLadmtM+sbV5RNElIOCMkSF1LHIzPrBzvLJgkpB4RkiQupdsPMenBl2SQh5YCQ\nLHEhbWnbMTa1+uL+tK1skpByQEiWuJAO9afua9bfsfnmtQvSVZ+XTRJSDgjJEngd6cjjfe2T\nl5E6Ln96vHSQkHJASJbYLUJffTA8PHKk2RQh5YCQLOy1g0ZIluCQ9g++3XyIkHJASJbgkEbS\nzuZDhJQDQrIQEjRCshASNEKyRIY0NDS0IQ3Uj0Mnf+7jF2esvb7iL4zTQEiWyJBqtdol6cL6\nsXby5x5ZPKOzv+IvjNNASBZ+tINGSBZCgkZIFkKCRkgWQoJGSJboLULHSt8acgoh5YCQLNEh\nffb+oaYzhJQDQrLEhvTmmpReLoqB10qnCCkHhGQJDemdzu519ZA+WdbJHfuyR0iW0JCu6/l4\n/+R3pIM9g2VjhJQDQrKEhrTksaIRUvHo4rIxQsoBIVlCQ5r3wnRIz3aUjRFSDgjJEhrSpfdM\nh3SL2G03g5ByQEiW0JBuXzw8GdLo3WlT2Rgh5YCQLKEh7V8xrz/19XWlngNlY4SUA0KyxF5H\nOrhxSUrpgo0HS6cIKQeEZIne2TBxYKT0u9EkQsoBIVnC345r/L09zW7ZR0g5ICRLYEh7NtcP\nz19U/9mu963SQULKASFZ4kJ6o3PRRLEzLbp+07XndLFFKHuEZIkLae3SkaJYVdtXX+6dP1A2\nSUg5ICRLXEjnbS2KT9MTjfVt55dNElIOCMkSF9LC+4pirG1XY/3QuWWThJQDQrLEhXTl6sNF\nccXWyeVYb2/ZJCHlgJAscSG9lPpfOTZ88XOHj+69Oj1VNklIOSAkS+Cvv59ZmOZfVkvt7ant\nrtJ3biCkHBCSJfKC7IEd62rdXUvW3DlcPkdIOSAkCzcag0ZIFkKCRkgWQoJGSBZCgkZIFkKC\nRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZC\ngkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgW\nQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZI\nFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJG\nSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKC\nRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZC\ngkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgW\nQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZI\nFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJG\nSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKC\nRkgWQoJGSBZCgkZIFkKCRkgWQoJGSBZCgkZIFkKCRkgWQoJGSJbwkMbf2/NRkxFCygEhWQJD\n2rO5fnj+opRS71ulg4SUA0KyxIX0RueiiWJnWnT9pmvP6Xq3bJKQckBIlriQ1i4dKYpVtX31\n5d75A2WThJQDQrLEhXTe1qL4ND3RWN92ftkkIeWAkCxxIS28ryjG2nY11g+dWzZJSDkgJEtc\nSFeuPlwUV2ydXI719pZNElIOCMkSF9JLqf+VY8MXP3f46N6r01Nlk4SUA0KyBP76+5mFaf5l\ntdTentrumigbJKQcEJIl8oLsgR3rat1dS9bcOVw+R0g5ICQLW4SgEZIlNKSJD1/dvfv1ZjuE\nCCkLhGQJDGl0aGlq6Hn4y9JBQsoBIVniQtq3Kq1e/8D27ffetDz1jpZNElIOCMkSF9KGjhen\nV+NPtm0pmySkHBCSJS6kZbfOrG9cUTZJSDkgJEtcSB2PzKwf7CybJKQcEJIlLqTaDTPrwZVl\nk4SUA0KyxIW0pW3H2NTqi/vTtrJJQsoBIVniQjrUn7qvWX/H5pvXLkhXfV42SUg5ICRL4HWk\nI4/3tU9eRuq4/Onx0kFCygEhWWK3CH31wfDwyJFmU4SUA0KysNcOGiFZgkPaP/h28yFCygEh\nWYJDGkk7mw8RUg4IyUJI0AjJQkjQCMkSGdLQ0NCGNFA/Dp38ubvTcf5OxV8Yp4GQLJEh1Wq1\nS9KF9WPt5M+Nvjtj4F9W/IVxGgjJwo920AjJQkjQCMlCSNAIyUJI0AjJEr1F6FjpW0NOIaQc\nEJIlOqTP3j/UdIaQckBIltiQ3lyT0stFMfBa6RQh5YCQLKEhvdPZva4e0ifLOrljX/YIyRIa\n0nU9H++f/I50sGewbIyQckBIltCQljxWNEIqHl1cNkZIOSAkS2hI816YDunZjrIxQsoBIVlC\nQ7r0numQbhG77WYQUg4IyRIa0u2LhydDGr07bSobI6QcEJIlNKT9K+b1p76+rtRzoGyMkHJA\nSJbY60gHNy5JKV2w8WDpFCHlgJAs0TsbJg6MlH43mkRIOSAkyxy8Hdefbfuj8gFCygEhWeYg\npI/TS+UDhJQDQrIE3mjsazeln9+woWySkHJASJa4kNKfUzZJSDkgJEtcSP+6ve93Dk36w/Sf\nDpX+WwpCygEhWQL/jvR7fW0bPy34O9JZgpAskb9sOPYr85f/FiGdJQjJEvtbu/95TRr4iJDO\nCoRkif7197PfWvRAeql8hpByQEiW8OtIB7+f0kvlI4SUA0KyzMEF2f829KPyAULKASFZuGMf\nNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQ\nEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKy\nEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRC\nshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0\nQrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshAS\nNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQ\nEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKy\nEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRC\nshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0\nQrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshAS\nNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyEBI0QrIQEjRCshASNEKyhIc0/t6e\nj5qMEFIOCMkSGNKezfXD8xellHrfKh0kpBwQkiUupDc6F00UO9Oi6zdde07Xu2WThJQDQrLE\nhbR26UhRrKrtqy/3zh8omySkHBCSJS6k87YWxafpicb6tvPLJgkpB4RkiQtp4X1FMda2q7F+\n6NyySULKASFZ4kK6cvXhorhi6+RyrLe3bJKQckBIlriQXkr9rxwbvvi5w0f3Xp2eKpskpBwQ\nkiXw19/PLEzzL6ul9vbUdtdE2SAh5YCQLJEXZA/sWFfr7lqy5s7h8jlCygEhWdgiBI2QLKEh\nTXz46u7drzfbIURIWSAkS2BIo0NLU0PPw1+WDhJSDgjJEhfSvlVp9foHtm+/96blqXe0bJKQ\nckBIlriQNnS8OL0af7JtS9kkIeWAkCxxIS27dWZ944qySULKASFZ4kLqeGRm/WBn2SQh5YCQ\nLHEh1W6YWQ+uLJskpBwQkiUupC1tO8amVl/cn7aVTRJSDgjJEhfSof7Ufc36OzbfvHZBuurz\nsklCygEhWQKvIx15vK998jJSx+VPj5cOElIOCMkSu0Xoqw+Gh0eONJsipBwQkoW9dtAIyRIc\n0v7Bt5sPEVIOCMkSHNJI2tl8iJByQEgWQoJGSBZCgkZIlsiQhoaGNqSB+nHo5M89990Zy6+q\n+AvjNBCSJTKkWq12Sbqwfqyd/Lnf3Tbj29dV/IVxGgjJwo920AjJQkjQCMlCSNAIyUJI0AjJ\nEr1F6FjpW0NOIaQcEJIlOqTP3j/UdIaQckBIltiQ3lyT0stFMfBa6RQh5YCQLKEhvdPZva4e\n0ifLOrljX/YIyRIa0nU9H++f/I50sGewbIyQckBIltCQljxWNEIqHl1cNkZIOSAkS2hI816Y\nDunZjrIxQsoBIVlCQ7r0numQbhG77WYQUg4IyRIa0u2LhydDGr07bSobI6QcEJIlNKT9K+b1\np76+rtRzoGyMkHJASJbY60gHNy5JKV2w8WDpFCHlgJAs0TsbJg6MlH43mkRIOSAky9y8Hdfo\nn5R9lpByQEiWwJB+/3u1n3ly6j1Wt5WempByQEiWuJD+R1da0JF+tnGvPkLKHyFZ4kK6ruO3\nJ8Ye7/j7XxSEdDYgJEtcSCt+afL4euf3xgnpbEBIlsA79t3f+PAb6U5COhsQkiUupEv/2dTH\nf5u2E9JZgJAscSHd2fZrRyc/TtycfvgDQsoeIVniQvrTnvTdxmLizpQIKXuEZAm8jvR/Nv3w\n69fopwgpe4Rk4UZj0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAI\nyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQ\nCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI\n0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlC\nSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJ\nQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAI\nyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQ\nCMlCSNAIyUJI0AjJQkjQCMlCSNAIyUJI0AjJQkjQCMlCSNAIyXKWhXTbd2FY98en/yoQkuUs\nC2nhX/+7+Ob+8m+d/qtASJazLaR/MtdP2FnlrxJSFEJqZYQUhpBaGSGFIaRWRkhhCKmVEVIY\nQmplhBSGkFoZIYUhpFZGSGEIqZURUhhCamWEFIaQWhkhhSGkVkZIYQiplRFSGEJqZYQUhpBa\nGSGFIaRWRkhhCKmVEVIYQmplhBSGkFoZIYUhpFZGSGEIqZURUhhCamWEFIaQWhkhhSGkVkZI\nYQiplRFSGEJqZYQUhpBaGSGFIaRWRkhhCKmVEVIYQmplhBSGkFoZIYUhpFZGSGEIqZURUhhC\namWEFIaQWhkhhSGkVkZIYUJDmvjw1d27X/+o2RghVYWQwgSGNDq0NDX0PPxl6SAhVYWQwsSF\ntG9VWr3+ge3b771peeodLZskpKoQUpi4kDZ0vDi9Gn+ybUvZJCFVhZDCxIW07NaZ9Y0ryiYJ\nqSqEFCYupI5HZtYPdpZNElJVCClMXEi1G2bWgyvLJgmpKoQUJi6kLW07xqZWX9yftpVNElJV\nCClMXEiH+lP3Nevv2Hzz2gXpqs/LJgmpKoQUJvA60pHH+9onLyN1XP70eOkgIVWFkMLEbhH6\n6oPh4ZEjzaYIqSqEFIYtQq2MkMKwRaiVEVIYtgi1MkIKwxahVkZIYdgi1MoIKQxbhFoZIYVh\ni1ArI6QwbBFqZYQUhi1CrYyQwrBFqJURUhi2CLUyQgrD23G1MkIKExzS/sG3mw8RUlUIKUxw\nSCNpZ/MhQqoKIYUhpFZGSGEIqZURUpjIkIaGhjakgfpx6OTPDf/KjDUDpzzFwr/5D/HN/cSZ\nhPQTc/1ff1b56cCQarXaJenC+rF28ueeWTOj9sunPMUNa2D4zvun/2q9/525/q8/u9xw6qdy\nrn60A1oKIQEVICSgAoQEVGA2tggdm5iFkwI5m42QPnv/0CycFchY9SG9uSall4ti4LXKzwxk\nq/KQ3unsXlcP6ZNlne9WfWogW5WHdF3Px/snvyMd7Bms+tRAtioPacljRSOk4tHFVZ8ayFbl\nIc17YTqkZzuqPjWQrcpDuvSe6ZBuEbvtgBZVeUi3Lx6eDGn07rSp6lMD2ao8pP0r5vWnvr6u\n1HOg6lMD2ar+OtLBjUtSShdsPFj5mYFszcbOhokDI3w3wl8sc3XHPqClzNUd+4CWMld37ANa\nylzdsQ9oKXN1xz6gpczVHfuAljJXd+wDWspc3bEPaClzdcc+oKXM1R37gJYyV3fsA1rKXN2x\nD2gphARUgJCAChASUAFCAipASEAFCAmoACEBFSAkoAKEJI0O9XSuHPzdyeWhLbWOizfsazx8\n9N+cs2Zq4PhHcUaaPtfHL7NFSMqPV6br7vvFeee+VxRH+tM/f+TWjlWT/3D+R/3d06/o8Y/i\njDR9ro9f5ouQlM3p1+rHXel7RfF4+tX68j+noaL4s/l/b6Rr6hU97lGcmabP9XHLjBGS8sNr\njtaPE/NrRdHX3fgXVn9j6UTx46GjxfQretyjODNNn+vjlhkjpFMb67iy+Kr9msZ6ffqw8XHq\nFT3xUZypUz/XJy4zRUin9kT9h44P0vrG+oH0auPj1Ct64qM4U6d+rk9cZoqQTunNzp85Vgyn\nzY0/7Ei7Gx+nXtETH8UZKnmuT1xmipBO5Te7+n88mcwdjT9tT7/d+Ph1SH/+UZyZsuf6xGWm\nCEmbuD/9wmf1jyPp5saf701Td2mfekVPfBRnovy5PnGZKUKSJm5NP2i86cSReWsbD9yU/lfj\n49QreuKjOANNnusTl5kiJGlLenR69Z0Fh+vH/7t8+n1jp1/REx7FGWj2XJ+wzBQhKbvS/3/j\n8qfTg/Xjf0gPTf1x+hU94VGcvqbP9QnLTBGS8lPpB9saRovxq9LgQ99v+3b9/5Vv1h9oX1Y/\n/Onxj+LMNH2uj1tmjJCU9LU/KYrPt9Y6Ltn84/qjj3396Mjxj+LMNH2uj3/a80VIQAUICagA\nIQEVICSgAoQEVOD/ARd8N8UwdI+2AAAAAElFTkSuQmCC"
          },
          "metadata": {
            "image/png": {
              "width": 420,
              "height": 420
            }
          }
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "head(new_df)"
      ],
      "metadata": {
        "_uuid": "8bb3c7b4-3050-42b6-8913-1ec0630f5ff3",
        "_cell_guid": "fe4ee89f-9291-4e46-b42d-54b7efad8b53",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "19ZXtqgC0fkf",
        "outputId": "0cdb4377-0832-43ea-e785-3aeba90f1da3",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 286
        }
      },
      "execution_count": 27,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 6 × 8</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>CustomerID</th><th scope=col>InvoiceNo</th><th scope=col>StockCode</th><th scope=col>Quantity</th><th scope=col>TotalAmount</th><th scope=col>InvoiceDate</th><th scope=col>Country</th><th scope=col>Year</th></tr>\n",
              "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>17850</td><td>536365</td><td>85123A</td><td>6</td><td>15.30</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>71053 </td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84406B</td><td>8</td><td>22.00</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029G</td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029E</td><td>6</td><td>20.34</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>22752 </td><td>2</td><td>15.30</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>2010</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 6 × 8\n\n| CustomerID &lt;dbl&gt; | InvoiceNo &lt;chr&gt; | StockCode &lt;chr&gt; | Quantity &lt;dbl&gt; | TotalAmount &lt;dbl&gt; | InvoiceDate &lt;dttm&gt; | Country &lt;chr&gt; | Year &lt;chr&gt; |\n|---|---|---|---|---|---|---|---|\n| 17850 | 536365 | 85123A | 6 | 15.30 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 71053  | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 84406B | 8 | 22.00 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 84029G | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 84029E | 6 | 20.34 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n| 17850 | 536365 | 22752  | 2 | 15.30 | 2010-12-01 08:26:00 | United Kingdom | 2010 |\n\n",
            "text/latex": "A tibble: 6 × 8\n\\begin{tabular}{llllllll}\n CustomerID & InvoiceNo & StockCode & Quantity & TotalAmount & InvoiceDate & Country & Year\\\\\n <dbl> & <chr> & <chr> & <dbl> & <dbl> & <dttm> & <chr> & <chr>\\\\\n\\hline\n\t 17850 & 536365 & 85123A & 6 & 15.30 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 71053  & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 84406B & 8 & 22.00 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 84029G & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 84029E & 6 & 20.34 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\t 17850 & 536365 & 22752  & 2 & 15.30 & 2010-12-01 08:26:00 & United Kingdom & 2010\\\\\n\\end{tabular}\n",
            "text/plain": [
              "  CustomerID InvoiceNo StockCode Quantity TotalAmount InvoiceDate        \n",
              "1 17850      536365    85123A    6        15.30       2010-12-01 08:26:00\n",
              "2 17850      536365    71053     6        20.34       2010-12-01 08:26:00\n",
              "3 17850      536365    84406B    8        22.00       2010-12-01 08:26:00\n",
              "4 17850      536365    84029G    6        20.34       2010-12-01 08:26:00\n",
              "5 17850      536365    84029E    6        20.34       2010-12-01 08:26:00\n",
              "6 17850      536365    22752     2        15.30       2010-12-01 08:26:00\n",
              "  Country        Year\n",
              "1 United Kingdom 2010\n",
              "2 United Kingdom 2010\n",
              "3 United Kingdom 2010\n",
              "4 United Kingdom 2010\n",
              "5 United Kingdom 2010\n",
              "6 United Kingdom 2010"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "new_df=new_df %>% drop_na()\n",
        "colSums(is.na(new_df))"
      ],
      "metadata": {
        "_uuid": "bd6bf35b-f48e-4313-bfbd-ce183c9fe7e1",
        "_cell_guid": "a4dd6185-12ae-4163-9cab-d6a231f07e50",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "ldn68B2r0fkf",
        "outputId": "a56cc7ce-07f9-475e-ffd5-0426d8352293",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 34
        }
      },
      "execution_count": 28,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<style>\n",
              ".dl-inline {width: auto; margin:0; padding: 0}\n",
              ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
              ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
              ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
              "</style><dl class=dl-inline><dt>CustomerID</dt><dd>0</dd><dt>InvoiceNo</dt><dd>0</dd><dt>StockCode</dt><dd>0</dd><dt>Quantity</dt><dd>0</dd><dt>TotalAmount</dt><dd>0</dd><dt>InvoiceDate</dt><dd>0</dd><dt>Country</dt><dd>0</dd><dt>Year</dt><dd>0</dd></dl>\n"
            ],
            "text/markdown": "CustomerID\n:   0InvoiceNo\n:   0StockCode\n:   0Quantity\n:   0TotalAmount\n:   0InvoiceDate\n:   0Country\n:   0Year\n:   0\n\n",
            "text/latex": "\\begin{description*}\n\\item[CustomerID] 0\n\\item[InvoiceNo] 0\n\\item[StockCode] 0\n\\item[Quantity] 0\n\\item[TotalAmount] 0\n\\item[InvoiceDate] 0\n\\item[Country] 0\n\\item[Year] 0\n\\end{description*}\n",
            "text/plain": [
              " CustomerID   InvoiceNo   StockCode    Quantity TotalAmount InvoiceDate \n",
              "          0           0           0           0           0           0 \n",
              "    Country        Year \n",
              "          0           0 "
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Group by Number of Customers in a Country\n",
        "\n",
        "cus_id = new_df %>%\n",
        "  group_by(Country) %>%\n",
        "  summarise(CustomerID = sum(CustomerID))\n",
        "\n",
        "cus_id = cus_id[order(-cus_id$CustomerID),]\n",
        "cus_id"
      ],
      "metadata": {
        "_uuid": "e72a4a10-4b84-4b48-977d-a0ffe0bfbaa2",
        "_cell_guid": "9af141c9-f3aa-448f-9f75-89626b8889dd",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "FBgnJNCk0fkf",
        "outputId": "73007c8b-dc8d-45e9-f512-e121d52e294b",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 1000
        }
      },
      "execution_count": 29,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 37 × 2</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>Country</th><th scope=col>CustomerID</th></tr>\n",
              "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>United Kingdom      </td><td>5626432595</td></tr>\n",
              "\t<tr><td>Germany             </td><td> 120075093</td></tr>\n",
              "\t<tr><td>EIRE                </td><td> 110391745</td></tr>\n",
              "\t<tr><td>France              </td><td> 107648864</td></tr>\n",
              "\t<tr><td>Netherlands         </td><td>  34190538</td></tr>\n",
              "\t<tr><td>Spain               </td><td>  32689291</td></tr>\n",
              "\t<tr><td>Belgium             </td><td>  25718288</td></tr>\n",
              "\t<tr><td>Switzerland         </td><td>  23775916</td></tr>\n",
              "\t<tr><td>Portugal            </td><td>  18864800</td></tr>\n",
              "\t<tr><td>Australia           </td><td>  15693002</td></tr>\n",
              "\t<tr><td>Norway              </td><td>  13507651</td></tr>\n",
              "\t<tr><td>Channel Islands     </td><td>  11285219</td></tr>\n",
              "\t<tr><td>Italy               </td><td>  10156663</td></tr>\n",
              "\t<tr><td>Finland             </td><td>   8699324</td></tr>\n",
              "\t<tr><td>Cyprus              </td><td>   7715880</td></tr>\n",
              "\t<tr><td>Sweden              </td><td>   6790083</td></tr>\n",
              "\t<tr><td>Austria             </td><td>   5021102</td></tr>\n",
              "\t<tr><td>Denmark             </td><td>   4876734</td></tr>\n",
              "\t<tr><td>Japan               </td><td>   4567292</td></tr>\n",
              "\t<tr><td>Poland              </td><td>   4341972</td></tr>\n",
              "\t<tr><td>USA                 </td><td>   3672086</td></tr>\n",
              "\t<tr><td>Unspecified         </td><td>   3348046</td></tr>\n",
              "\t<tr><td>Israel              </td><td>   3164467</td></tr>\n",
              "\t<tr><td>Singapore           </td><td>   2918376</td></tr>\n",
              "\t<tr><td>Canada              </td><td>   2615483</td></tr>\n",
              "\t<tr><td>Iceland             </td><td>   2247154</td></tr>\n",
              "\t<tr><td>Malta               </td><td>   2158496</td></tr>\n",
              "\t<tr><td>Greece              </td><td>   2008584</td></tr>\n",
              "\t<tr><td>United Arab Emirates</td><td>   1018952</td></tr>\n",
              "\t<tr><td>European Community  </td><td>    921588</td></tr>\n",
              "\t<tr><td>RSA                 </td><td>    721868</td></tr>\n",
              "\t<tr><td>Lebanon             </td><td>    574380</td></tr>\n",
              "\t<tr><td>Lithuania           </td><td>    536620</td></tr>\n",
              "\t<tr><td>Brazil              </td><td>    408608</td></tr>\n",
              "\t<tr><td>Czech Republic      </td><td>    383430</td></tr>\n",
              "\t<tr><td>Bahrain             </td><td>    210027</td></tr>\n",
              "\t<tr><td>Saudi Arabia        </td><td>    125650</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 37 × 2\n\n| Country &lt;chr&gt; | CustomerID &lt;dbl&gt; |\n|---|---|\n| United Kingdom       | 5626432595 |\n| Germany              |  120075093 |\n| EIRE                 |  110391745 |\n| France               |  107648864 |\n| Netherlands          |   34190538 |\n| Spain                |   32689291 |\n| Belgium              |   25718288 |\n| Switzerland          |   23775916 |\n| Portugal             |   18864800 |\n| Australia            |   15693002 |\n| Norway               |   13507651 |\n| Channel Islands      |   11285219 |\n| Italy                |   10156663 |\n| Finland              |    8699324 |\n| Cyprus               |    7715880 |\n| Sweden               |    6790083 |\n| Austria              |    5021102 |\n| Denmark              |    4876734 |\n| Japan                |    4567292 |\n| Poland               |    4341972 |\n| USA                  |    3672086 |\n| Unspecified          |    3348046 |\n| Israel               |    3164467 |\n| Singapore            |    2918376 |\n| Canada               |    2615483 |\n| Iceland              |    2247154 |\n| Malta                |    2158496 |\n| Greece               |    2008584 |\n| United Arab Emirates |    1018952 |\n| European Community   |     921588 |\n| RSA                  |     721868 |\n| Lebanon              |     574380 |\n| Lithuania            |     536620 |\n| Brazil               |     408608 |\n| Czech Republic       |     383430 |\n| Bahrain              |     210027 |\n| Saudi Arabia         |     125650 |\n\n",
            "text/latex": "A tibble: 37 × 2\n\\begin{tabular}{ll}\n Country & CustomerID\\\\\n <chr> & <dbl>\\\\\n\\hline\n\t United Kingdom       & 5626432595\\\\\n\t Germany              &  120075093\\\\\n\t EIRE                 &  110391745\\\\\n\t France               &  107648864\\\\\n\t Netherlands          &   34190538\\\\\n\t Spain                &   32689291\\\\\n\t Belgium              &   25718288\\\\\n\t Switzerland          &   23775916\\\\\n\t Portugal             &   18864800\\\\\n\t Australia            &   15693002\\\\\n\t Norway               &   13507651\\\\\n\t Channel Islands      &   11285219\\\\\n\t Italy                &   10156663\\\\\n\t Finland              &    8699324\\\\\n\t Cyprus               &    7715880\\\\\n\t Sweden               &    6790083\\\\\n\t Austria              &    5021102\\\\\n\t Denmark              &    4876734\\\\\n\t Japan                &    4567292\\\\\n\t Poland               &    4341972\\\\\n\t USA                  &    3672086\\\\\n\t Unspecified          &    3348046\\\\\n\t Israel               &    3164467\\\\\n\t Singapore            &    2918376\\\\\n\t Canada               &    2615483\\\\\n\t Iceland              &    2247154\\\\\n\t Malta                &    2158496\\\\\n\t Greece               &    2008584\\\\\n\t United Arab Emirates &    1018952\\\\\n\t European Community   &     921588\\\\\n\t RSA                  &     721868\\\\\n\t Lebanon              &     574380\\\\\n\t Lithuania            &     536620\\\\\n\t Brazil               &     408608\\\\\n\t Czech Republic       &     383430\\\\\n\t Bahrain              &     210027\\\\\n\t Saudi Arabia         &     125650\\\\\n\\end{tabular}\n",
            "text/plain": [
              "   Country              CustomerID\n",
              "1  United Kingdom       5626432595\n",
              "2  Germany               120075093\n",
              "3  EIRE                  110391745\n",
              "4  France                107648864\n",
              "5  Netherlands            34190538\n",
              "6  Spain                  32689291\n",
              "7  Belgium                25718288\n",
              "8  Switzerland            23775916\n",
              "9  Portugal               18864800\n",
              "10 Australia              15693002\n",
              "11 Norway                 13507651\n",
              "12 Channel Islands        11285219\n",
              "13 Italy                  10156663\n",
              "14 Finland                 8699324\n",
              "15 Cyprus                  7715880\n",
              "16 Sweden                  6790083\n",
              "17 Austria                 5021102\n",
              "18 Denmark                 4876734\n",
              "19 Japan                   4567292\n",
              "20 Poland                  4341972\n",
              "21 USA                     3672086\n",
              "22 Unspecified             3348046\n",
              "23 Israel                  3164467\n",
              "24 Singapore               2918376\n",
              "25 Canada                  2615483\n",
              "26 Iceland                 2247154\n",
              "27 Malta                   2158496\n",
              "28 Greece                  2008584\n",
              "29 United Arab Emirates    1018952\n",
              "30 European Community       921588\n",
              "31 RSA                      721868\n",
              "32 Lebanon                  574380\n",
              "33 Lithuania                536620\n",
              "34 Brazil                   408608\n",
              "35 Czech Republic           383430\n",
              "36 Bahrain                  210027\n",
              "37 Saudi Arabia             125650"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# 5 Countries with most number of Customers\n",
        "\n",
        "bp_custid_Country_top=cus_id$Country[1:5]\n",
        "bp_custid_CustomerID_top=cus_id$CustomerID[1:5]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_custid_CustomerID_top, names=bp_custid_Country_top, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "a67dc9de-e861-4cdc-9db7-2fe3334666e7",
        "_cell_guid": "8f1978fc-e82e-430d-a1ec-235c6c91d799",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "tjBkGqES0fkf",
        "outputId": "a65bda78-8bb0-4068-ad42-1489e20ec1dc",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 437
        }
      },
      "execution_count": 30,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "plot without title"
            ],
            "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAACXBIWXMAABJ0AAASdAHeZh94\nAAAgAElEQVR4nOzdd4AV5d347fvIFhZBFGkCS7WCQQSUIgTUYEDJUhSDiH2JYAEFjC1SEgOW\nREwU8UmMDQwGI1EES2KBB43UBMkjwYiKooIUWYTAKrDn/eP8ct4NCKyyy8LNdf11dmbOzPeM\nT/kwM2c3kUwmAwAAB75DynsAAABKh7ADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiERGeQ8AZWjFihXv\nvPNO6nVWVlbHjh0TiUT5jgQAZSeRTCbLewYoK3369PnTs89kZGeHZPLLf29esmTJCSecUN5D\nAUBZccWOmG3fvr1ZtzNPG3Bh4cZNj/S7atu2beU9EQCUIc/YAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYHRjy8/MTicSyZctKd7d9+/ZN\nJBIff/xx6e62uIyMjLZt25bd/gGANGFXaiZNmpRIJCpWrPivf/1r57VHH310ixYtSr63O+64\no9QzDgCIm7ArZV9++eVVV121lztZuXLlzTffLOwAgG9E2JWyjh07vvLKK5MmTdqbncyfP7+0\n5gEADh7CrpQNGzasQYMGw4YNW79+/W42++yzz66++uoGDRpkZWXVqFGjZ8+e6Zjr3r17jx49\nQgjdunVLJBKvv/56+l2HHHLInXfe2bhx4+zs7Pr16//sZz9LJpMl2Wf4z+N0q1ev7tKlS05O\nzrRp03aeat68eb169apevXpWVlbDhg0vuuii5cuXp9f269cvkUhs2rTpxhtvbNiwYXZ2dm5u\n7rhx44rP8Pzzz7dq1SonJ6dmzZr5+fkFBQXF9//ll1/efffdJ510UtWqVatUqdK8efO77767\nqKioZKcWANiDjPIeIDaZmZn33XdfXl7eTTfd9D//8z9fu82aNWvatGlTUFAwcODAE088ccWK\nFQ888EDHjh1feumlTp06/eQnP6lWrdrEiRNHjBhx8sknN23aNP3G22+/fdGiRT/60Y8qVKhw\n3333jRgx4uijj77gggv2uM8QQlZWVgjh+uuvz8zMHDFiROPGjXeYauHChZ06dapWrdqQIUNq\n1679/vvvjx8//s9//vOSJUuOPPLI9B7OO++8Ro0aPfnkk0VFRaNHjx46dOjhhx9+2WWXhRDe\neOONvLy8WrVqjRgxokaNGrNmzcrLyzvkkP//Hw+DBg165JFH+vXrN2jQoEQi8dJLL/34xz/+\n8MMP77///tL9rwAAB6kkpWTixIkhhOeeey6ZTPbo0SORSPz1r39Nr23SpMlJJ52Uej1o0KCM\njIz58+en13700UdVqlRp3bp16sexY8eGEF544YX0BldccUUIoUOHDl999VVqycKFC0MIeXl5\nJdzn5ZdfHkI466yztm/fnt7mhz/8YQhhxYoVyWTygQceaNmy5WuvvZZee99994UQ7rvvvuIz\nXHDBBekN3nvvvRBC9+7dUz9269YthDBv3rz0BqnHDdu0aZP6sVKlSu3atSt+0q6//vpzzz13\n27Ztuz21316vXr2a531/0HOPX/b7B0IIixcvLqMDAcD+wK3YMnHfffdVqlTpyiuv3LZt2w6r\nksnkU0891bx583r16q36j8zMzPbt2y9YsGDTpk272e2wYcMyMzNTr08++eQKFSp8+umnJdxn\nIpEIIVxyySXFL6EVN2jQoIULF3bu3DmEsHXr1sLCwtTFwuJ3Y1N7SL9u3LhxpUqVUr8tpaio\naObMmU2aNDnllFPSGwwYMKD4ezMzMz/88MPVq1enl9xzzz1//OMfK1SosJtPDQCUkFuxZSI3\nN3fUqFE33HDDuHHjbrjhhuKrVq9evXbt2rVr1x511FE7v/Gjjz4qfu91B8ccc0z6dSKRqFy5\n8pYtW77RPo877rjdjD1x4sSHHnpo8eLFxZ+N26FN69evX/zHzMzMrVu3hhBWrly5ZcuWHe7w\nHn/88cV//OlPfzpkyJBjjjmmR48ep59++llnnVW3bt3dzAMAfCPCrqxcd911EydOHDVq1Pnn\nn9+gQYP08o0bN4YQWrRokbrfuoM6dersZp/Z2dlfu7zk+6xatequdn7LLbeMHTu2devW48aN\na9SoUXZ29ttvv52fn7/DZulLhjvYvHlzCKFixYrFF1asWDF1pTBl8ODBJ5544n333Td16tSJ\nEycmEolu3bo98MADxc8PAPCtCbuykpGR8eCDD5522mnXXnvttGnT0jdAq1SpknrRtWvX0jrW\n3u+zsLDw3nvvzc3Nfe211ypXrpxauGHDhpLvIScnJ7Wf4gs3bdqULPad2RDCGWecccYZZ3z5\n5ZezZ8+eNGnS448//r3vfe/tt99OfTMDANgbnrErQ+3atcvPz3/uuef+9Kc/pcOlVq1a1atX\nX7p06Q6/CmTNmjXf+kB7v89Vq1Zt2bKldevW6aoLIcyaNavkM9SuXTsrK+uDDz4ovnDx4sVf\nu3F2dvb3vve9Rx99dODAgcuWLVu0aFHJDwQA7IqwK1t33nlnjRo1Bg8eXPzCVZ8+fQoLC+++\n++70kjVr1jRv3vwHP/hB6sfUlwlSz8+V0B73uXu1atVKJBLFvyexaNGixx9/POx0EW5XMjIy\n2rdvv2zZsuK/PG/8+PHp13PmzKlbt25qn2mpC5m7ur0LAHwjbsWWrSOOOOIXv/hF6pukJ510\nUmrhqFGjZsyYMWbMmJUrV3bq1OnTTz998MEH161bN3jw4NQGqa8g3HHHHR988EHHjh2Lf890\nV/a4z93Lyck555xzpk+fPnDgwM6dOy9ZsuT+++9/4okn8vLyZsyYMXny5Ly8vD3u5Mc//vGs\nWbO6d+9++eWXH3nkkbNmzdq8eXP6qb7WrVtXq1ZtwIABr7/+eosWLRKJxIIFCx599NEOHTp8\no7+iCwDsiit2Ze7iiy8+/fTTiy+pWbPm3LlzBw0a9PLLL+fn5991110tWrR4/fXXu3Tpktog\nLy/v3HPP/cc//nH77bd/+OGHJTnKHve5Rw8//HC/fv2mTp06cODAN954Y9q0ad26dbvtttsK\nCgqGDh2a+n7G7nXr1m3y5Mm1atW655577rrrrpo1az799NOHHXbYV199FULIyMiYNWvWVVdd\n9eqrr95www0333zzwoULb7/99hdeeKH4FywAgG8tscOz7RCT3r17v7d982kDLizcuOmRflct\nXrz4O9/5TnkPBQBlxRU7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASGSU9wBQhhKJxNJXZi+f9/dkUVEI4ZBD/EsGgJglkslkec8AZWXx4sVz\n5sxJvc7JyenXr1+FChXKdyQAKDvCDgAgEu5MAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEIqO8B4Ay9MILL8yaNWv32+Tm5l599dX7Zh4A\nKFOJZDJZ3jNAWendu/erc9+s3rj+rjb497r1X65a+/nnn+/LqQCgjLhiR+QatD7ptAEX7mrt\nB28unDvh8X05DwCUHc/YAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYxWbSpEmJXbv//vvLe0AAoKxklPcAlIk2bdq0bdt25+UtWrTY98MA\nAPuGsItT165dR40aVd5TAAD7lFuxB6O+ffsmEonVq1d36dIlJydn2rRpqeXz5s3r1atX9erV\ns7KyGjZseNFFFy1fvjz9rn79+iUSiU2bNt14440NGzbMzs7Ozc0dN25cMplMb7Nq1ar8/Py6\ndeseeuihJ5100q9+9att27al13722WdXX311gwYNsrKyatSo0bNnz/nz5++rDw0A8XPF7mCU\nlZUVQrj++uszMzNHjBjRuHHjEMLChQs7depUrVq1IUOG1K5d+/333x8/fvyf//znJUuWHHnk\nkel3nXfeeY0aNXryySeLiopGjx49dOjQww8//LLLLgshrFmzpnXr1ps2bbr44osbNGgwc+bM\n66677h//+MdDDz2UWtumTZuCgoKBAweeeOKJK1aseOCBBzp27PjSSy916tSpPE8HAMRC2B2M\nMjMzQwhr16594YUXDjnk/121nTdvXtOmTX/5y1927tw5taRu3brXXnvt5MmTr7nmmhBCRkZG\nCKFatWoTJkxIbTBhwoQmTZpMnTo1FXYjR4785JNPXnrppbPOOiuEMGzYsO7du//ud7+7/vrr\nmzVrllr75ptvtm7dOvX2/v37N2vWbPjw4a7bAUCpcCv2YJRIJEIIl1xySbrqQgiDBg1auHBh\nquq2bt1aWFjYtGnTEELxu7Gpd6VfN27cuFKlSh9//HEIIZlMTpkyJTc3t0uXLukNfv3rX7/6\n6qu1atVKJpNPPfVU8+bN69Wrt+o/MjMz27dvv2DBgk2bNpXp5wWAg4QrdnEaPXr06NGjd17+\n97//Pf3F2OOOO26HtRMnTnzooYcWL15cUFCQXlj8IbkQQv369Yv/mJmZuXXr1hDCypUr161b\n17Jly1Q1pjRu3Dh1n/ezzz5bu3bt2rVrjzrqqJ2n+uijj1IRCQDsDWEXp1NOOeXUU0/deXmN\nGjXSr6tWrVp81S233DJ27NjWrVuPGzeuUaNG2dnZb7/9dn5+/g57SN3G3dmWLVtCCNnZ2V+7\nduPGjSGEFi1ajB07due1derU2d2HAQBKRtjF6eyzz/5Gv+6ksLDw3nvvzc3Nfe211ypXrpxa\nuGHDhpLvoXbt2iGE4pf6iqtSpUrqRdeuXUu+TwDgG/GMHSGEsGrVqi1btrRu3TpddSGEWbNm\nlXwPhx56aI0aNf75z3+m7symvPPOO/fff//bb79dq1at6tWrL126dIfyW7Nmzd4PDwCkCDtC\nCKFWrVqJRKL49yQWLVr0+OOPhxAKCwtLuJMePXqsW7fuscceSy8ZNWrUtdde++WXX4YQ+vTp\nU1hYePfdd6fXrlmzpnnz5j/4wQ9K5SMAAG7FEkIIOTk555xzzvTp0wcOHNi5c+clS5bcf//9\nTzzxRF5e3owZMyZPnpyXl7fHnYwcOXL69OmDBg166623GjRoMGvWrOnTp1988cUtW7YMIYwa\nNWrGjBljxoxZuXJlp06dPv300wcffHDdunWDBw8u+88HAAcFV+z4fx5++OF+/fpNnTp14MCB\nb7zxxrRp07p163bbbbcVFBQMHTo09e2H3atXr96cOXP69u07ZcqUW265ZcmSJb/85S8ffvjh\n1NqaNWvOnTt30KBBL7/8cn5+/l133dWiRYvXX3+9+K9HAQD2RqL434OCyPTu3fu97ZtPG3Dh\nrjb44M2Fcyc8/vnnn+/LqQCgjLhiBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEH\nABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJ\nYQcAEAlhBwAQCWEHABAJYQcAEImM8h4AytZX/978xarVu1q7uWDDvhwGAMqUsCNmlStXXvqn\nPy19ZfZutsnNzd1n8wBAmUokk8nyngHKypYtW1auXLn7bY444ogjjjhi38wDAGVK2AEARMKX\nJwAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIpFR3gNAGfr5z3/+8MMP736bihUrvvjii7m5uftmJAAoO8KOmC1cuPDLyhWP7thmVxsUFRXN\nnvDYxx9/LOwAiICwI3JHNsxt2vX0Xa3dvnXb7AmP7ct5AKDseMYOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsLuYDdp0qTEbq1duzaEsHTp\n0kQi0bVr192/MTs7u3HjxgMGDPjggw++6SEAgL2UUd4DsF9o06ZN27Ztv3ZVTk7Obt542mmn\ndejQIf3j+vXr58+f/9BDDz311FOvv/76iSeeuPeHAABKSNgRQghdu3YdNWrUt3jj9773vZ3f\n+Itf/OKGG2645ZZbpk2btveHAABKyK1YSt/gwYOzsrLeeOON8h4EAA4uwo7Sl0wmi4qKDj30\n0PIeBAAOLsKO0nfnnXdu27atS5cu5T0IABxcPGNHCCGMHj169OjROy8fOXLk7h+MmzlzZvEN\nCgoK5s6dO2fOnKOPPvqnP/1pqRwCACghYUcIIbRr1659+/Y7L//ahcXNmjVr1qxZxZfUrFnz\nlltuGTZsWLVq1UrlEABACQk7QgjhrLPO+naXzYpfb9uyZUvTpk3XrVs3aNCgHapubw4BAJSQ\nZ+woNTk5Offee+/GjRuvvfba8p4FAA5Gwo7S1KNHj27duj3zzDPPPPNMec8CAAcdYUcp+9Wv\nfpWdnX3ttddu3LixvGcBgIOLZ+wIIYQXX3yxoKDga1edc8453+gXlxxzzDHDhg0bM2bMrbfe\n+utf/7osDgEAfC1hRwghzJ07d+7cuV+7qnr16t+0um699daJEyeOHz++f//+p556alkcAgDY\nWSKZTJb3DFBWevfu/d72zacNuHBXG2zfuu03vS//61//2q5du305GACUBc/YAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARCKjvAeAsrVu+Yol\nL762q7VFRUX7chgAKFPCjpi1atXqrbfeWvHCrN1s07Rp03r16u2zkQCg7CSSyWR5zwAAQCnw\njB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCQyynsAKENbtmxZuXLlHjfLysqqV6/ePpgHAMpUIplMlvcMUFYuvvjiiRMnlmTLBQsWtGrV\nqqznAYAy5YodMdu0adPxZ3Zs1bfH7jZKhid+NHzTpk37aigAKCvCjshlHVrpsNo1d7eFi9YA\nxMKXJwAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7PZTyWRy6tSp5557bm5ubsWKFStWrNioUaMrrrhi7ty55T0aALCfyijvAfga69ev79On\nzyuvvFK5cuXTTz+9QYMGmzZtWrJkycMPP/zII4+MGTPmpptuKu8ZAYD9jrDb7ySTyR/+8Iev\nvPLKD3/4wwceeKBatWrpVfPnzz/33HNvvvnmZs2a/eAHPyjHIQGA/ZBbsfud6dOn/+Uvf2nX\nrt3vf//74lUXQjjllFOmTp06YMCAww47rPjyzz777Oqrr27QoEFWVlaNGjV69uw5f/789Nq+\nffsmEonVq1d36dIlJydn2rRpIYR+/folEomCgoIrr7yyVq1alSpVatu27bx58zZv3nzdddfV\nrVu3cuXK7du3/9vf/lb8QPPmzevVq1f16tWzsrIaNmx40UUXLV++PL02tc9NmzbdeOONDRs2\nzM7Ozs3NHTduXDKZDCF07NixQoUKK1asKL7DdevWZWZmtmvXrtROHwAcxITdfmfixIkhhJtv\nvvmQQ77mv07r1q1/85vfdOrUKb1kzZo1bdq0eeKJJy644IKHH3546NChCxcu7Nix46xZs1Ib\nZGVlhRCuv/76zMzMESNGNG7cOL2wT58+devWffHFFydMmPDWW2/16dPnhz/8YcWKFadNm/bY\nY4/985//PPvss7du3Zraz8KFCzt16jRv3rwhQ4aMHz/+ggsuePbZZ9u0abNu3briBzrvvPO+\n+OKLJ5988rXXXmvatOnQoUMfffTREEJ+fn5RUdHjjz9e/OM8/fTT27Ztu/TSS0v1FALAQcqt\n2P3O3LlzE4nE6aefXsLtR44c+cknn7z55putW7dOLenfv3+zZs2GDx+eum6XmZkZQli7du0L\nL7yQjsWMjIwQwjHHHDNixIgQwsknn/z8889PmTLl1FNPveOOO0IIrVq1mj179q9+9av58+e3\nb98+hDBv3rymTZv+8pe/7Ny5c2ondevWvfbaaydPnnzNNdek91mtWrUJEyakNpgwYUKTJk2m\nTp162WWX9enTZ8iQIY899titt96aHn7KlCkVK1bs27fvXp0yACCE4Irdfuizzz6rWrVq5cqV\nS7JxMpl86qmnmjdvXq9evVX/kZmZ2b59+wULFmzatCmEkEgkQgiXXHLJzpcAe/funX59zDHH\nhBB69OiRXnLccceFEFauXJn6cdCgQQsXLkxV3datWwsLC5s2bRpCKH43NnWg9OvGjRtXqlTp\n448/DiFUqlTpggsuePfdd994443U2jVr1sycObNXr15Vq1YtyYcFAHZP2O13KlSoUFRUtMPC\nDh06JP5bQUFBCGH16tVr167929/+dtR/e+mll0IIH330UXoPqUrbQd26ddOvU9fbii9JXepL\n34oNIUycOLFTp05HHHFEVlZWTk7OmWeeGULYtm1b8X3Wr1+/+I+ZmZnpPeTn54cQUndmQwhP\nP/309u3bL7vsspKdGABgD9yK3e/UqVNn2bJln3/+efFvTvTs2fPEE09MvX755Zffe++91OuN\nGzeGEFq0aDF27Niv3VX69ddeFUul2+6XpN1yyy1jx45t3br1uHHjGjVqlJ2d/QY36GkAAB18\nSURBVPbbb6darYR7aNWq1cknnzxlypRf//rXOTk5U6ZMyc3NTdUhALD3hN1+p0OHDsuWLXv+\n+ef79++fXjh8+PD06759+6bDrkqVKqkXXbt2LdOpCgsL77333tzc3Ndeey19m3jDhg3fdD9X\nXHHFNddcM2PGjA4dOsyaNWtX3xEBAL4F/z91v5O6BvbTn/508+bNe9y4Vq1a1atXX7p0aerO\nbNqaNWtKd6pVq1Zt2bKldevWxR/+S3/xtuQuvPDCnJycP/zhD3/4wx+Kiop8HxYASpGw2++c\ndtppF1100bvvvtu1a9cPP/yw+Kovv/zy17/+9XPPPVelSpXU7xYJIfTp06ewsPDuu+9Ob7Zm\nzZrmzZuX7m8wrlWrViKRKP49iUWLFqV+d0lhYWHJ93P44Yf37t37+eeff/TRRzt06HD00UeX\n4pAAcJBzK3Z/9Nvf/jaZTE6aNOnYY4/97ne/e+yxxxYVFX300UezZ8/euHFjy5YtH3vssUqV\nKqU2HjVq1IwZM8aMGbNy5cpOnTp9+umnDz744Lp16wYPHlyKI+Xk5JxzzjnTp08fOHBg586d\nlyxZcv/99z/xxBN5eXkzZsyYPHlyXl5eCXeVn5//xBNPLFq06KGHHirFCQEAV+z2R9nZ2RMn\nTnzttdfOP//8ZcuWPfzww5MmTXr33Xd79uz57LPPLliwIP1FihBCzZo1586dO2jQoJdffjk/\nP/+uu+5q0aLF66+/3qVLl9Kd6uGHH+7Xr9/UqVMHDhz4xhtvTJs2rVu3brfddltBQcHQoUNT\nX+Moic6dO9evX79SpUrnn39+6U4IAAe5ROrPPcE+s2LFiiZNmlxxxRXp32Ncdnr37v3e9s2n\nDbhwdxslkxPyLpk5c2bxv+cBAAciV+zY14YNGxZCuP7668t7EACIjWfs2EeWLVv25z//+dln\nn/3zn/88cuTIY489trwnAoDYCDv2kcWLF19zzTXVq1cfM2bMTTfdVN7jAECEhB37SO/evXf+\nU2kAQCnyjB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJDLKewAoWx8ueOvfn68v\n7ykAYF8QdsRswIABxx577B43O6TjmSeddNI+mAcAylQimUyW9wwAAJQCz9gBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAEQio7wHgDK0ePHi\nOXPmlPcUALCPJJLJZHnPAGXl3HPPnf7SixWrVC7vQQCgzG3Z8IUrdsQsmUwef2bH0wZcWN6D\nAECZe+3e33rGDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwu6b6du3byKRWLVqVSnuMyMjo23btnu5k7IYbAelMicAUHYOirD7xS9+kUgkHnzwwa9d\nW7ly5dq1a5dwVy1atPj+97+fnZ2d+vGOO+5YtmxZ6Uy5C5MmTUokEqNGjdph+R/+8IcKFSqc\neuqpX3zxxc6DAQAHoYMi7ErRTTfd9OKLLx5xxBEhhJUrV958881lHXZfa/r06RdddNF3vvOd\nl1566bDDDtthMADg4CTsvr358+eXy3FfffXVPn36HHPMMX/5y1+UHACQJuz+S79+/RKJxKZN\nm2688caGDRtmZ2fn5uaOGzcumUymNkg/yta9e/cePXqEELp165ZIJF5//fXUBp999tnVV1/d\noEGDrKysGjVq9OzZc4f+e/7551u1apWTk1OzZs38/PyCgoJvNOGcOXN69OiRm5v78ssv16hR\nI728+DN2e/wUIYQZM2aceuqplSpVql279pAhQ7Zs2ZKbm9uyZcuSz/nhhx9edtlldevWzcrK\nql69el5e3rx583Y4kwUFBVdeeWWtWrUqVarUtm3befPmbd68+brrrqtbt27lypXbt2//t7/9\n7Rt9fABgNzLKe4D9S1ZWVgjhvPPOa9So0ZNPPllUVDR69OihQ4cefvjhl112WfEtf/KTn1Sr\nVm3ixIkjRow4+eSTmzZtGkJYs2ZNmzZtCgoKBg4ceOKJJ65YseKBBx7o2LHjSy+91KlTpxDC\nG2+8kZeXV6tWrREjRtSoUWPWrFl5eXmHHFLSvH7rrbe6det25JFHvvLKK0cdddS3/hT/+7//\n26NHjxo1atx0003Vq1d/6qmn+vbtu3Hjxrp166b2sMc5V6xYceqpp27evHnQoEHNmjX75JNP\nHnjgge9+97svv/xyhw4d0jP06dOnY8eOL7744uLFiwcOHNinT5/mzZs3a9Zs2rRpy5cvz8/P\nP/vss1esWJGZmfkN/iMBALsg7P5LRkZGCKFatWoTJkxILZkwYUKTJk2mTp26Q9i1bdt25syZ\nIYR27dp17do1tXDkyJGffPLJm2++2bp169SS/v37N2vWbPjw4anrdj//+c+3b9/+zDPPnHLK\nKSGE/Pz8q6++evbs2SWZ7Z133jnrrLMOPfTQV199NTc3d28+xe233759+/bnnnsuNeeVV17Z\npUuXDRs2pPewxzlvu+221atXT506tVevXqklvXr1+s53vnPDDTe8+eab6RmOOeaYESNGhBBO\nPvnk559/fsqUKaeeeuodd9wRQmjVqtXs2bN/9atfzZ8/v3379iU5AwDA7rkV+zUuueSS9OvG\njRtXqlTp448/3uO7ksnkU0891bx583r16q36j8zMzPbt2y9YsGDTpk1FRUUzZ85s0qRJqpZS\nBgwYUJKRPvzww+9973urV6+uU6dOnTp19vJTzJ49+/jjj0/XZ4UKFW688cb0xnucM5lMPvPM\nM7Vq1erZs2d64QknnNCuXbs5c+asW7cuvbB3797p18ccc0wIIXX/OuW4444LIaxcubIkHwcA\n2CNh9zXq169f/MfMzMytW7fu8V2rV69eu3bt3/72t6P+20svvRRC+Oijj1auXLlly5bGjRsX\nf9fxxx9fkpEeffTRww8//Kqrrpo/f/4O1w6/6acoKCgoLCw8+uiji68tfs1sj3OuWrVqw4YN\nzZo1SyQSxbdJhdq//vWv9JL0vd3wn2t4xZek7sCW5NwCACVxUNyKTfVH8a8OFFdUVLTDU27f\n7pGvjRs3hhBatGgxduzYndfWqVNnzZo1IYSKFSsWX16xYsUd8uhrnXXWWX/6059ycnJWrVr1\n5JNPHn/88SNHjtz9W3b1KVJX1CpVqlR8YZUqVSpUqJB6vXnz5t3P+e9//zuEcOihh+6w55yc\nnPTaXc3gcToAKDsHRdilftNb8VuEaRs2bNiyZUuTJk32/ihVqlRJvUg/creDTZs2hRAKCwt3\nWLir4iyuXbt2qRR77LHH/vWvf40ePfqEE044//zzv8WcqbTaYYzNmzdv37499TrVZ7uZs3Ll\nyuG/Ay4ltSR9HgCAfeyguBV78sknhxCmT5++c0I9++yzIYQ2bdrs/VFq1apVvXr1pUuX7vCb\nQVIX6kIItWvXzsrK+uCDD4qvXbx48Tc6SuXKladNm1atWrVLL7302/0ivdq1ax9yyCEffvhh\n8YVz584tvsHu56xdu3a1atX++c9/7nA+lyxZkkgkUjdkAYB976AIu1atWp166qlz584dPXp0\n+rpUCOGvf/3r8OHDK1SoMHjw4G+x29S9yy1btqSX9OnTp7Cw8O67704vWbNmTfPmzX/wgx+E\nEDIyMtq3b79s2bLiQTZ+/PhvetxGjRpNmTJl69atPXr0KMm3OnaQlZXVunXrxYsXL126NLVk\n+/btd955Z3qDkszZu3fvlStXprI4ZdGiRfPmzTvjjDMOP/zwbzoSAFAqDopbsYlEYvLkyaef\nfvro0aOffPLJNm3aVKxYcenSpf/7v/+bkZHxm9/8pnnz5t9it6mvF9xxxx0ffPBBx44dTznl\nlFGjRs2YMWPMmDErV67s1KnTp59++uCDD65bty4djj/+8Y9nzZrVvXv3yy+//Mgjj5w1a9bm\nzZurVq36TQ99xhln3HPPPYMHD87Ly5s9e/bOj7vt3g033NCnT5+zzz77qquuOuywwyZNmtS4\ncePif2d2j3OOHj069WfNBg8efNxxxy1fvnz8+PGVK1e+5557vulnAQBKy0FxxS6E0Lhx48WL\nF48cObJixYp//OMfH3300Y8++ujSSy9duHDh5Zdf/u32mZeXd+655/7jH/+4/fbbU3c2a9as\nOXfu3EGDBr388sv5+fl33XVXixYtXn/99S5duqTe0q1bt8mTJ9eqVeuee+656667atas+fTT\n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\ntXvb1f+i7vEoJRljP7Ru3bphw4al/pm4q7DbB2fvsMMOq1OnTvETtX79+pycnLZt2+7NpytT\n11133Zlnnln8X9hFRUU5OTkNGjRIL3HqduUnP/nJzTffXHzJtm3bMjMzTzrppPQSZ2/37rjj\njkQi8cILL+wcdk7drqT66d13393NNgfh2RN27Ee2bNlSoUKFM888c4fll156aQjhvffeSyaT\nq1evbtCgQdWqVW+88caJEyeOGTOmXr162dnZM2fO3HmHX/u/qHs8SknG2P99bdjtg7O3adOm\nEMJ3v/vdHTZo3rx5VlbWtm3b9u5j7TuFhYWZmZmnnXZa6ken7hv5+OOPQwg9e/ZM/ejs7d6y\nZctycnIGDRq0fv36HcLOqduNSy65JISwZs2abdu2rVixYs2aNTtscHCevYxv+2welL4VK1Zs\n3749Nzd3h+UNGjQIIbz//vuNGzceOXLkJ5988uabb6a/GdC/f/9mzZoNHz58/vz5IYRly5al\n37ht27aCgoL0ksqVK9euXXuPR9m+ffsexyitj7yP7YOz17Bhw4yMjLVr1+6wQaVKlb766quV\nK1fWq1evjD5d6fqf//mfrVu3pm6yBKeuxDZv3jxv3rwhQ4ZUqVLl1ltvTS109nbvyiuvPPzw\nw8eOHZtMJndY5dTtxoYNG0II99577wMPPJBq4mOPPXbkyJH9+vVLbXCQnr1935KwKwsXLgwh\nXH311Tssv/vuu0MIU6dOLSoqql69esuWLVf+t+9///shhI0bN27dunU3/9Peo0ePkhxljxuU\n3RkoRTtfsds3Zy+ZTHbs2DGRSBT/2sHSpUszMzNDCP/85z/L/qOXgpkzZ2ZlZXXo0GHr1q1J\np67EqlatmvrI/fv3T1/bdvZ275FHHgkh/PGPf0wmkztcsXPqdq9z584hhMaNG48dO/bxxx+/\n+eabDzvssBDCgw8+mDyIz54rdux3EonEDkuSyWRq+erVq9euXbt27dqjjjpq5zd+9NFHJ5xw\nwlNPPZVectVVV7Vt2/biiy9O/Vi3bt2SHKWEGxxw9tnZGz169BlnnJGXlzdu3LgTTjhh0aJF\nt9xyS/369d97773s7OxS/1ylbvLkyZdddtmJJ5747LPPZmRkBKeuxAYNGvT555//3//93+9/\n//vly5c/9thjjRs3dvZ2Y/Xq1cOGDevevfu55577tWudut247bbbrrnmmq5dux566KGpJf37\n92/ZsuUtt9xy2WWXrV+//uA8e8KO/UjqH1s7//qfL774IoRQpUqV1KoWLVqMHTt257fXqVMn\nkUicd9556SXDhw8/9thjiy8pyVH2uMG3+Gj7g31z9kIIp59++n333XfjjTf26tUrhFC5cuWf\n/exnCxYseO+994444ohS/lSlKplMjho1KvULC6ZMmZL+b+3UlVD6/MycObN79+69evX6+9//\n7uztxpAhQ7766qvx48d/7VqnbvfOOOOMHZY0bdr07LPP/tOf/vTWW2+lJv//2rufUHbjOA7g\n32fPs5qH1tNCs7Vd5MYKBxfKQeTAUGoXQ4/UYi1JS9phB7tKycFhOa250DionRyEHSg3lLRa\n5P9hLAc8v8M3T36zPUPbjL1ft+frw7fnnfg+PN/PtwjTw8IOCojZbOY4LhqNJo2fnp4SQmpq\nauSnH9ooKEez6PV65YJvT/2z5GVKTtOjl+Pj44ODgwcHByqViu4pa2xsrKqqEgTh21PnmiRJ\nIyMjfr/f6XTOzc3RjmIUovuq1tZWq9UaCASOj491Oh0dRHpJNjc3g8Ggx+NRqVR0uwldLiQS\niVgsptVq8Y33DZWVlYSQh4cHs9lMR4ouvfz/9xdAQVNTE8/zj4+P8sjLy4vBYDCZTPSyvLxc\no9Hc39+//6yrq6uUXy3d9vWMs2QsKHwpd8XmJz1JkpL2gkWjUYZh7Hb7V+8in2jrBJ/Pl/Kj\niC6dWCxmsVgGBgaSxvv6+shbjzGkl9Lk5KTCb2e32y0huvTi8fji4mIgEEgab25uJm/tC4oz\nPRwpBoVFFMVEIkHfS6WWlpbOz8/lM3b6+/ufnp7eF1xfX1sslq6urizOkrHgl8pPem63u6Sk\nhG46I4S8vr5OTExIkuRwOLJxEzmxuro6Pz/vcrmmp6dTFiC6dIxG493d3crKSiQSkQdPTk7C\n4XBZWVltbS1BemmIorjxv2AwSAhpb2/f2NigDTUQXTo8z8/Ozo6Ojh4dHcmDoVBoe3u7vr6e\n9i4o0vR+ZDkJkM7z83NLSwshxGq1er1em83GMExdXZ38tHR5eUn/wD48PLy8vOzz+WjnyXA4\nnMVZMhYUpq2tLflQHZZl9Xq9fHlzcyPlK73Dw0Oe5wVBcLlcXq+XNhqYmprKyT1nSXV1NSHE\n6XS6P6AHByE6BWtrayzLqtVqm802MzMzNDREX2ZfWFigBUjvkz72sUN0CkKhEMMwpaWloih6\nPJ7e3l6GYbRa7f7+Pi0ozvSwsIOCE4/H6VnsarXaaDSOjY3d3t6+L7i4uHA4HCaTieM4QRC6\nu7sjkUjWZ8lYUIBSviNMyc3Z85Pe7u5uR0eHTqfTaDQNDQ1+vz87d5gzCk+/Z2dntAbRKdjb\n2+vp6amoqGBZVhCEtra29fX19wVI7zM+LuwkRKdoZ2ens7NTEASO4wwGg91uTzqIogjTYyTF\nn2gAAAAA8FvgHTsAAACAPwILOwAAAIA/Ags7AAAAgD8CCzsAAACAP+Ifg3DV0d6Il94AAAAA\nSUVORK5CYII="
          },
          "metadata": {
            "image/png": {
              "width": 420,
              "height": 420
            }
          }
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# 5 Countries with least number of Customers\n",
        "\n",
        "bp_custid_Country_low=cus_id$Country[33:37]\n",
        "bp_custid_CustomerID_low=cus_id$CustomerID[33:37]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_custid_CustomerID_low, names=bp_custid_Country_low, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "8919c98e-a4d8-4147-af38-0ea8ec4c77a9",
        "_cell_guid": "7263bd19-9227-4242-8c5a-3bcecaf9e943",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "drtzoqUc0fkf",
        "outputId": "b6f78fc7-882f-4377-dba4-3a14276428f4",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 437
        }
      },
      "execution_count": 31,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "plot without title"
            ],
            "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAACXBIWXMAABJ0AAASdAHeZh94\nAAAgAElEQVR4nOzde3xU9Z344TOEJAYCInJTCJfgNbaKQlsrUGjRqgty87KoiLWLFSoIglsV\nKyIqotSVqsjWC0WxQlFA8AK4usCqq0CpYBWkXIQFJUKQqxAgYX5/zK+zWUCIgWTky/P8NXPm\nzDmf+b6sfXvmklg8Ho8AADj6VUr1AAAAHBnCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQlVM9AJSj\nNWvWLF26NNVTcDBnnHFGgwYNUj0FQCBi8Xg81TNAebnyyiunTH2lcmZmqgfhwIp27brqiitf\nfPHFVA8CEAhX7AhZcXHxWZe2a3njtakehAN7Z/RzxcXFqZ4CIBw+YwcAEAhhBwAQCGEHABAI\nYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQ\nCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcA\nEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEH\nABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhh\nBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYXcUq1y58vnnn5+43a1b\nt1gslp+fX5EDJE66du3ag+9QwVMBwDFL2B2uvXv3vvzyyx06dGjSpElWVlZWVlbTpk2vu+66\nRYsWVeQYzZo1u/jiizMzMw+yz2233RaLxWrUqLFz587vzlQAwJEi7A7X1VdffeWVV3788ceX\nX375fffdd9ttt51++unjx49v2bLlO++8U2Fj3HHHHTNmzDjhhBO+aYfdu3c/99xzlSpV2rJl\ny0svvfQdmQoAOIIqp3qAo9usWbMmTpzYpk2bt956q3Ll/13MV199tWPHjrfccsuHH36YwvFK\nmjRpUkFBwa9//evRo0c//fTTPXr0SPVEAMAR5ordYVm8eHEURVdeeWXJqoui6LLLLhs3btyI\nESP27t2b2DJv3rwuXbrUqlUrIyOjcePG11133apVq5L7d+jQIRaLbd68ObmlqKgoFotdeOGF\nyS1vvPFG8+bNs7Ky6tSp07Nnz5I7R6X4NNtTTz0VRVH//v1btWr17rvvLlmyZP+nr1+//qKL\nLsrKypo2bVppxk7YvXv3wIED69evn5mZecYZZzz55JPfNFVpjgYAlJkrdoclJycniqL/+I//\nuOmmm/Zpu+7duydvL1iwoE2bNjVr1uzXr1+9evVWrlw5atSoN998c/HixSeeeGJpTvTee+91\n7Nixbt26gwcPrl279pw5czp27FipUmm7/O9///vs2bMvuOCCU089tUePHu+8884zzzzzyCOP\nJHfIyMiIoujWW29NT08fPHhwbm5u6ce+5ZZbtm7d2qdPn8LCwhdeeOHmm2/OyMjo2bPnPjMc\n/iIAAAcn7A7LpZdeeu65506dOvUHP/jBL3/5y3bt2p155pmxWGyf3ebNm5eXl/fII4+0bds2\nsaV+/fp9+/YdP358nz59SnOiBx54oLi4+JVXXvnBD34QRVHPnj1vvvnm0n+GL3G57oYbboii\n6J//+Z/79ev3/PPPP/jgg4mei6IoPT09iqKCgoLp06cne7GUY2/dunX27NmJZ/3yl7887bTT\nhg0btn/YHf4iAAAH563Yw5Kenj579uybb7556dKlt9xyy1lnnVW7du0uXbqMGTNmx44dyd16\n9+69YMGCRNDs2bOnsLAwLy8viqJSvhG5d+/e2bNnN23aNFF1CTfeeGMph9y1a9dzzz2XlZV1\n1VVXRVFUrVq1yy+/vKCgYMqUKcl9EjF6/fXXl7wKWMqxe/XqlXxWo0aNWrZs+dlnn61Zs2af\nMQ5zEQCAQxJ2h6t69epPPPHEhg0bpk2bdvvtt59++umvv/76v/zLvzRu3Pitt95K7jZu3Lg2\nbdqccMIJGRkZWVlZ7dq1i6KoqKioNKdYt27dzp07E2+PJp1xxhmlnDDxtYnLL7+8evXqiS2J\nS3fPPPPMPnuefvrp+2wpzdhnn312ybuJOVevXr3/JIezCADAIQm7I6Nq1aqXXXbZ8OHD33vv\nvS+//PKxxx7bunXrFVdcUVBQEEXRoEGDevTosWPHjkcffXT27Nnvv//+/lF1EImLf8cdd1zJ\njccdd9z+7/keUOJ92LZt2y7/hwYNGtStW/ftt99euXJlyT2PP/74kndLOXayFxOqVKkSRVFh\nYeE+ux3mIgAAh+QzdkfeCSec0Ldv39WrVz/yyCNz5sxp3779yJEjc3JyZs2alZ2dndhny5Yt\nBz/I7t27k7ezsrKi/VJp+/bt8Xj8kMMsXbp0zpw5URTt/6G3KIqeffbZBx544IBPLCwsLOXY\n+/zccSJDE3lXhqMBAGUm7MquuLi4T58+a9eunTp16v5fUK1Ro0YURdu3b8/Pz9+5c2eLFi2S\nQRNFUSK2khLfXdizZ09yy2effZa8Xa9evYyMjJJboij66KOPSjNk4nJdz549L7744pLbCwsL\nf/GLX/zxj3+899579/k+b0Jpxk5YsmRJyfdwV6xYEf3jDdkyHA0AKDNhV3ZpaWmfffbZzJkz\n77zzzmHDhqWlpSUfWrFixR/+8IfKlSu3bdu2Tp06sVis5FcEFi5c+Pzzz0clLsKddNJJURQt\nWbKkdu3aiS2JHRIqV658wQUXzJ49e/78+cnvT4waNeqQEya+NpGZmTls2LDkkZNeeeWVSZMm\nvf766506ddr/uXXr1j3k2Aljxozp3Llz4vbatWv/+7//Oy8vr169emU7GgBQZj5jd1iefvrp\n3Nzchx9+uEmTJr179x4yZMhtt9122WWX5eXlff755yNGjGjUqFFWVlb79u0//PDDXr16TZgw\nYfDgwT/72c+efvrpypUrv/766+PHj//6668TfwdiwIABs2bNmjt37qBBg95///1q1aolT/Sb\n3/wmFot16NDhzjvv/N3vfnfZZZfl5+fv85G4/U2aNGnjxo3XXHPN/lUXRVHfvn0TL+GAzy3N\n2Ik9d+3a1aVLl6eeemrkyJE///nPd+/efffdd5f5aABAmQm7w5KTk7Nw4cLhw4fn5ORMnDjx\n/vvvf/LJJ//+979379593rx5/fv3T+w2ZsyYa665ZvLkyb169XrvvfemTZt26aWX3n333Zs3\nbx4wYMC2bdvOP//8sWPH7ty5s3379p06ddq4ceOrr75arVq1Xbt2JY5w6aWXjh8/vm7duv/2\nb//28MMP16lTZ9KkSdWrVy/5Ubz9/eEPf4iiqF+/fgd8tE2bNt///vdnzJixdu3aA+5wyLET\nF9smTJjQuHHjIUOG3H777VEU/fGPf+zWrVsZjlbaRQcAvkGsNB/Ah6NU165dVxTvaHnjtake\nhAN7Z/Rzedkn/vnPf071IACBcMUOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEJVTPQCUo1gs9unb76ya92GqB+HACrduO+uyjqmeAiAcsXg8\nnuoZoLx89NFHH3zwQaqn4GAuuOCC733ve6meAiAQwg4AIBA+YwcAEAhhBwAQCGEHABAIYQcA\nEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEH\nABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEIjKqR4AytH06dPnzJmT6ing\nW6tatepdd91VqZL/9ga+nVg8Hk/1DFBeunbt+p9z36+V2zDVg8C3sPvrHWs+/LigoODEE09M\n9SzAUcYVOwLXqMU5LW+8NtVTwLewcdWaNX3vSvUUwFHJdX4AgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7oiiKevbsGYvFli9ffmQP261bt1gslp+f\nf2QPCwAckLA7ur3wwguxEipVqlS7du1mzZr95je/2bhxY6qni5o1a3bxxRdnZmamehAAOCZU\nTvUAHAEtW7Zs1apVFEXxeHzjxo2zZs0aMWLE1KlT//rXv1atWjWFg91xxx133HFHCgcAgGOK\nsAvBhRdeOGTIkOTd4uLiiy+++O23354yZUr37t1TNxcAUKG8FRugtLS0Dh06RFG0YcOG5MZ5\n8+Z16dKlVq1aGRkZjRs3vu6661atWrXPEytVqvTQQw/l5uZmZmY2bNjwvvvui8fjiYcSn5Zb\nv379RRddlJWVNW3atNIctuRn7K655ppYLLZ9+/bbb7+9cePGmZmZOTk5jz76aPIUAMBhcsUu\nTIsXL46iqHnz5om7CxYsaNOmTc2aNfv161evXr2VK1eOGjXqzTffXLx48Yknnph81v33379w\n4cJf/epXaWlpjz/++ODBg0855ZSrr746iqKMjIwoim699db09PTBgwfn5uaW/rAJiSNcccUV\nTZo0mTBhwt69e++9994BAwbUqFHjhhtuqJBVAYDACbsQfPXVV8kvtG7atGnSpEnPPvvsL37x\ni5/85CeJjfPmzcvLy3vkkUfatm2b2FK/fv2+ffuOHz++T58+yeMsW7Zs7ty56enpURS1a9eu\nefPmEyZMSIRdYmNBQcH06dMrVar0rQ6bULly5SiKatasOXr06MSW0aNHN23adPLkycIOAI4I\nYReCxx9//PHHH0/ejcVivXr1Gj58eHJL7969e/funbi9Z8+e4uLivLy8KIr2eTd24MCBiYCL\noujcc89NS0v74osvkseMouj6669PVl3pD1vS9ddfn7ydm5tbpUqVtWvXfusXDAAciLALwZVX\nXnnVVVclbm/duvXTTz8dO3bslClTJk6c2Lp168T2cePGPfPMMx999NHmzZuTTywqKip5nFNP\nPTV5OxaLZWdn79y5s+QOp59++j6nLs1hS2rYsGHJu+np6Xv27CnNawQADknYhSAvL++KK64o\nueXmm28+99xzr7322mXLlmVmZg4aNOjBBx9s0aLFo48+2qRJk8zMzE8++aRnz577HOeQPzh3\n/PHHl7xbysOWlLwiCAAcccIuTI0aNfrZz342adKkTz75JC8vb+TIkTk5ObNmzcrOzk7ssGXL\nlsM8RWFhYXkcFgAoMz93Eqxt27ZFUVRYWJifn79z584WLVok8yuKojlz5hzm8cvpsABAmbli\nF6a//OUv77zzTnZ29jnnnFOpUqVYLFbyCw0LFy58/vnnoygqLCws8ynq1q1bHocFAMpM2IXg\nrbfeSrbUrl27VqxYMWPGjOLi4jFjxiT+pFj79u1fe+21Xr16tW3bdvHixU888cSf/vSnjh07\nvv766+PHj+/YsWMZTpqVlVUehwUAykzYheC999577733ErePO+64Bg0adO7cuX///hdccEFi\n45gxY/r37z958uQJEyY0b9582rRprVq1uvvuu0eMGDFgwICf/vSnZTtvOR0WACibmD/oRMC6\ndu26onhHyxuvTfUg8C1sXLVmYt+7CgoK9v8LLgAH58sTAACBEHYAAIEQdgAAgRB2AACBEHYA\nAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2\nAACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQ\ndgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACB\nEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAA\ngRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgaic6gGgfO3+esfW/PWpngK+ha83bkr1\nCMDRStgRsuzs7E+nTPn07XdSPQh8O+np6ZmZmameAjj6xOLxeKpngPKyc+fOdevWpXoK+Nay\ns7Pr1KmT6imAo4+wAwAIhC9PAAAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgB\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELY\nAQAEQtgBAARC2AEABELYAQAEonKqB4By9MADD4wZMybVUwBUqLp1677zzjtpaWmpHoQUEHaE\nbMGCBbuyjzul9Y9SPQhABdm2vuD9l17dtWtXlSpVUj0LKSDsCNyJjXPyLvlpqqcAqCDr/77y\nry+9muopSBmfsQMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiE\nsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAI\nhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLAD\nAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISw\nAwAIhLBLgZ49e8ZiseXLl6d6kDLq1q1bLBZbu3ZtaXZI3M7Pz6/AAQHgGHUshl08Hn/55Zc7\nd+588sknZ2Zm1qlTp0WLFg888MCXX36Z6tG+0QsvvBDbT2ZmZm5u7o033vjZZ5+lesBv1KxZ\ns4svvjgzMzPVgwBA+CqneoCKtnnz5iuvvPKtt96qUqVKu3btGjVqtHHjxnnz5v32t7/9/e9/\nP2nSpNatW6d6xm/UsmXLVq1aJe9u2rRp/vz5zzzzzEsvvfTuu+9+73vfS+Fs3+SOO+644447\nUj0FABwTjrmwu/baa996661OnTo9/fTTtWvXTmzcu3fvU0891adPn06dOn366ad16tRJ7ZDf\n5MILLxwyZMg+G3/3u9/967/+66BBg6ZNm5aKoQCA74pj663YGTNmvPHGG+edd97LL7+crLoo\niipVqtSrV6+hQ4eed955K1asWLVq1f7ve8ZisVq1aiWf8uWXX958882NGjXKyMioXbt2586d\n58+fX/Jc+fn5PXv2rF+/ftWqVc8555zf//73RUVFJXeoVKnSQw89lJubm5mZ2bBhw/vuuy8e\nj5fhRd1yyy0ZGRnvvfdeKWfr0qVLLBZbt25dz54969atm5mZecYZZ4wePTq5Q4cOHWKx2ObN\nm5NbioqKYrHYhRdeWPK8u3fvHjhwYP369RNHePLJJw843j6fsTvksgAAZXZsXbF7/vnnoyi6\n6667Klc+wAsfNGjQoEGDoijavn37008/XfKhRYsWPfHEE2eccUbi7oYNG370ox9t3ry5V69e\n3/ve99asWfPkk0+2bt165syZbdq0SezQokWL7du39+jRo1GjRrNnz+7fv//f/va3Z555JnnM\n+++/f+HChb/61a/S0tIef/zxwYMHn3LKKVdfffW3fVHxeHzv3r1Vq1Yt5WyJj7t17tz5pz/9\n6ZQpU/bu3Tt06NBf//rX6enpPXv2LP15b7nllq1bt/bp06ewsPCFF164+eabMzIyDn6E0iwL\nAFBmx1bYzZ07d/8rT/vLzs4uGSibNm168MEHa9Wq9eKLLya23HPPPZ9//vn777/fokWLxJbu\n3bufddZZt912W+LaWGKHmTNn/vznP4+iaODAgR06dHj22WdvvfXWs846K/GUZcuWzZ07Nz09\nPYqidu3aNW/efMKECWUIu4ceeqioqOiiiy4q5WwJTZs2HT58eOL2Sy+9VLdu3QceeOBbhd3W\nrVtnz55dqVKlKIp++ctfnnbaacOGDTv4EUqzLABAmR1bYffll18ef/zx1atXL/1T4vF49+7d\nV69ePXPmzIYNGya2vPTSS2effXaDBg2S7zCmp6dfcMEFM2fO3L59e9WqVSdOnJiTk5OMrSiK\nHnvssYEDB9atWze5ZeDAgYmqi6Lo3HPPTUtL++KLLw4+zOzZs0t+xm7z5s1z58794IMPTjnl\nlKFDh5Zmtuzs7MTGbt26JY9z/PHHt27d+q233lq3bt1JJ51UypXp1atXouqiKGrUqFHLli1n\nzZq1Zs2anJycA+4fj8dLsywAQJkdW2FXqVKl4uLib/WUe++994033hg+fHi7du0SW9avX19Q\nUFBQUHDABvqf//mfGjVqbNy48bzzzovFYsntubm5ubm5Jfc89dRTk7djsVh2dvbOnTsPPsyc\nOXPmzJlTckudOnUGDRo0cODAmjVrlma2vLy8xO3TTjut5EP169ePoig/P7/0YXf22WeXvJub\nmztr1qzVq1d/U9itW7euNMsCAJTZsRV2J5988tKlSwsKCkp+DeIg3njjjaFDh3bt2vX2229P\nbty2bVsURc2aNXvwwQcPeIqNGzdG//go20GU4afd7rnnnuQVu507d+bl5W3cuLF3796JqivN\nbMnbVapUKflQ4iN6Jb8wcUj7XPhMHLCwsPCb9k9kqx+0A4Dyc2yF3QUXXLB06dJXX331hhtu\n2P/ReDz+t7/9LXkhauXKld27dz/99NPHjh1bcrdq1aolblxyySUHPEviDdZvFUllkJWVNXLk\nyM6dO/ft23fKlCmlnC3p66+/Lnl3y5YtURSdeOKJB9x59+7d+2/c5/rijh07ov16saR69epF\n5b8sAHAsO7Z+7iTRc0OHDk1c2drHk08+ec4554waNSqKop07d3bt2rWoqGjy5MnJWkqoW7du\nrVq1Pv30030aZcOGDYkbVatWrV279pIlS/bs2ZN8dOnSpU888cQnn3xyBF9Op06dLr300lde\neeWVV14p5WxJS5YsKXl32bJlURQl3odNhGnJ4Q/4ly32OcKKFSuiKDrI+6oVtiwAcMw6tsKu\ndevW//zP/7xq1aqLLrooESIJRUVFjz32WL9+/U466aRrrrkmiqKbbrpp0aJFf/zjH88888z9\nj3PllVcWFhaOGDEiuWXDhg1nn332ZZddlrjbqVOnjRs3Pvfcc8kdhgwZ0rdv3127dh3ZV/T7\n3/8+MzOzb9++yVQ95GwJY8aMSd7++9//Pn/+/NNPPz3x236JvCvZbYmfidlHySOsXbv2v//7\nv/Py8hKX5b5JhS0LABybjq23YqMoGjNmzK5du1555ZUzzjijdevWp5122ubNmz/44IPVq1fn\n5ubOmDHjhBNOeOGFF8aNG9esWbNNmzbt8xNrl1xySYMGDYYMGfL6668PGzZs3bp1bdq0+eKL\nL/793/9948aNt9xyS2K3e+6557XXXuvdu/eiRYsaNWo0Z86c1157rUePHuedd96RfTmnnnrq\nwIEDhw0bdtdddz322GNRFB1ytoRdu3ZddtllHTp02Lt378MPPxyPxwcPHpx4qEePHqNHjx4w\nYMCIESOqVKkyderU999/f5/LlokjdOnS5dJLL92xY8dTTz21e/fuu+++++DTVtiyAMCx6ZgL\nuypVqkyZMuXVV18dO3bsBx988O677x533HF5eXm33377L37xi6ysrCiKPv300yiKFi5ceOON\nN+7z9OnTpzdo0KBOnTpz584dOnToa6+9Nm7cuOzs7J/85CcvvfTSD3/4w8RuDRo0+OCDD377\n299OnDhx06ZNOTk5jzzySL9+/crjFd11113jxo0bNWpU9+7df/jDHx5ytoTRo0ePGjVq6NCh\nBQUFp5xyytixYxOXKqMoOv/888eOHfvwww+3b9++evXqnTp1evXVV/Py8pLX1RLfkJgwYcLQ\noUOHDBmycePGpk2b/vGPfyz5EyoHVJHLAgDHoFjZ/owVR69u3br9+c9/XrNmTYMGDVI9S7nr\n2rXriuIdLW+8NtWDAFSQ9X9fOWngkK+//vog32YjYMfWZ+wAAAIm7AAAAiHsAAACIeyOORMm\nTIjH48fCB+wA4Fgj7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewA\nAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHs\nAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAK4lbtwAABvU\nSURBVAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewA\nAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHs\nAAACUTnVA0D52rhqzeIZs1I9BUAF2ba+INUjkErCjpA1b9580aJFa6bPSfUgABXnxz/+cWZm\nZqqnIDVi8Xg81TMAAHAE+IwdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0A\nQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQd\nAEAghB0AQCCEHQBAIIQdAEAgKqd6AChHO3fuXLduXaqnADjq1axZs0aNGqmegkOLxePxVM8A\n5aVHjx7jxo1L9RQAR72mTZsuX7481VNwaK7YEbLt27ef0a51826dUj0IwFFs9fxFy6a+meop\nKBVhR+AyqlapXq9OqqcAOIpl1aie6hEoLV+eAAAIhLADAAiEsAMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLAD\nAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISw\nAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiE\nsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAI\nhLADAAiEsAMACISwAwAIhLADAAiEsKOidevWLRaL5efnJ2+vXbs21UMBQAiE3THqhRdeiJVQ\nqVKl2rVrN2vW7De/+c3GjRvL9dTNmjW7+OKLMzMzy/UsAHAMqpzqAUilli1btmrVKoqieDy+\ncePGWbNmjRgxYurUqX/961+rVq1aTie944477rjjjnI6OAAcy4TdMe3CCy8cMmRI8m5xcfHF\nF1/89ttvT5kypXv37qmbCwAoC2/F8r/S0tI6dOgQRdGGDRsSWxKfgVu/fv1FF12UlZU1bdq0\nxPZ58+Z16dKlVq1aGRkZjRs3vu6661atWpV4aNWqVbEDqVWrVsljJj5jBwAcQa7Y8X8sXrw4\niqLmzZsn7mZkZERRdOutt6anpw8ePDg3NzeKogULFrRp06ZmzZr9+vWrV6/eypUrR40a9eab\nby5evPjEE0+sVavW008/XfKYixYteuKJJ84444wKfzUAcGwRdse0r776avny5YnbmzZtmjRp\n0rPPPvuLX/ziJz/5SWJjenp6FEUFBQXTp0+vVOn/X9+dN29eXl7eI4880rZt28SW+vXr9+3b\nd/z48X369MnOzu7Zs2fyFJs2bXrwwQdr1ar14osvVtjrAoBjk7A7pj3++OOPP/548m4sFuvV\nq9fw4cNLbomi6Prrr09WXRRFvXv37t27d+L2nj17iouL8/LyoihKvhubFI/Hu3fvvnr16pkz\nZzZs2LDcXgcAEEXC7hh35ZVXXnXVVYnbW7du/fTTT8eOHTtlypSJEye2bt06udvpp5++zxPH\njRv3zDPPfPTRR5s3b05uLCoq2me3e++994033hg+fHi7du3K5xUAAP9L2B3T8vLyrrjiipJb\nbr755nPPPffaa69dtmxZ8qfmjj/++JL7DBo06MEHH2zRosWjjz7apEmTzMzMTz75pOTbrwlv\nvPHG0KFDu3btevvtt5frqwAAEoQd/0ejRo1+9rOfTZo06ZNPPjnvvPP236GwsHDkyJE5OTmz\nZs3Kzs5ObNyyZcs+u61cubJ79+6nn3762LFjy3tmACDBz52wr23btkVRVFhYeMBH8/Pzd+7c\n2aJFi2TVRVE0Z86ckvvs3Lmza9euRUVFkydPrlatWrlOCwAkuWLH//GXv/zlnXfeyc7OPuec\ncw64Q926dWOxWMnvSSxcuPD555+PSrTgTTfdtGjRopdffvnMM88s/5EBgP9P2B3T3nrrrWSN\n7dq1a8WKFTNmzCguLh4zZsw3/UmxrKys9u3bv/baa7169Wrbtu3ixYufeOKJP/3pTx07dnz9\n9dfHjx+/devWcePGNWvWbNOmTc8880zJ515yySUNGjQo91cFAMcqYXdMe++99957773E7eOO\nO65BgwadO3fu37//BRdccJBnjRkzpn///pMnT54wYULz5s2nTZvWqlWru+++e8SIEQMGDGjf\nvn0URQsXLrzxxhv3eeL06dOFHQCUn1g8Hk/1DFBeunbtuqJ4R8sbr031IABHseXvzP3ouZf9\nKcijgi9PAAAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAE\nQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEA\nBELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgB\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELY\nAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC\n2AEABKJyqgeA8rX6L4u+/mpTqqcAOIpt3/BVqkegtIQdIbvxxhtPO+20VE8BcNRr3Lhxqkeg\nVGLxeDzVMwAAcAT4jB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQd\nAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCE\nHQBAIIQdAEAghB0AQCAqp3oAKEcfffTRBx98kOopAKCCxOLxeKpngPJy+eWXvzZzxnHVslM9\nCACUu51btrpiR8ji8fgZ7Vq3vPHaVA8CAOVu1sinfcYOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC7ijWrVu3WCyWn59/wEd79uwZi8WWL19ewVOV\ndPAJAYAjS9h9d73wwguxWGzIkCHftEOzZs0uvvjizMzMxN3hw4enNuP2t8+EAEC5EnZHsTvu\nuGPGjBknnHBCFEXr1q278847v2thV3JCAKC8CbtAzJ8/P9UjAAApJuyOYslPsHXo0KFTp05R\nFF166aWxWOzdd99N7lOpUqWHHnooNzc3MzOzYcOG9913XzweTzzUoUOHWCy2efPm5M5FRUWx\nWOzCCy9Mbpk3b16XLl1q1aqVkZHRuHHj6667btWqVclHr7nmmlgstn379ttvv71x48aZmZk5\nOTmPPvpo8hT7fMbu4EcDAA5T5VQPwBHw29/+tmbNmuPGjRs8ePC5556bl5eXfOj+++9fuHDh\nr371q7S0tMcff3zw4MGnnHLK1VdfXZrDLliwoE2bNjVr1uzXr1+9evVWrlw5atSoN998c/Hi\nxSeeeGIURRkZGVEUXXHFFU2aNJkwYcLevXvvvffeAQMG1KhR44Ybbvi2RwMADpOwC8H5558/\ne/bsKIp+/OMfX3LJJSUfWrZs2dy5c9PT06MoateuXfPmzSdMmFDKsJs3b15eXt4jjzzStm3b\nxJb69ev37dt3/Pjxffr0iaKocuXKURTVrFlz9OjRiR1Gjx7dtGnTyZMn7x92hzwaAHCYhF3g\nBg4cmKi6KIrOPffctLS0L774opTP7d27d+/evRO39+zZU1xcnLgWuM/7p9dff33ydm5ubpUq\nVdauXVvmowEAZeYzdoE79dRTk7djsVh2dvbOnTtL//Rx48a1adPmhBNOyMjIyMrKateuXRRF\nRUVFJfdp2LBhybvp6el79uwp89EAgDITdoE7nN+QGzRoUI8ePXbs2PHoo4/Onj37/ffff+aZ\nZ/bfLXlF8IgcDQAoM2/F8r92796dvF1YWDhy5MicnJxZs2ZlZ2cnNm7ZsqVsRz6yRwMADsgV\nu2NX4kpbybdNP/vss+Tt/Pz8nTt3tmjRItlhURTNmTOnbOc6skcDAA5I2AUiLS0tiqJv9fm5\nk046KYqiJUuWJLc8//zzydt169aNxWIlv9mwcOHCxA6FhYXfdrwjezQA4IC8FftdN2PGjJK/\nIZzQqVOnn/70pyW35ObmRlE0fPjwzz77rHXr1j/4wQ8OeeQePXqMHj16wIABI0aMqFKlytSp\nU99///1q1aolHs3Kymrfvv1rr73Wq1evtm3bLl68+IknnvjTn/7UsWPH119/ffz48R07diz9\nqyjN0apWrVr6AwIA+xN233Vz586dO3fuPhsbNGiwT9h17Njx8ssvf+ONN5YtW/bUU0+VJuzO\nP//8sWPHPvzww+3bt69evXqnTp1effXVvLy8Xbt2JXYYM2ZM//79J0+ePGHChObNm0+bNq1V\nq1Z33333iBEjBgwYsM8Ah3TIowk7ADhMseRff4LwdO3adUXxjpY3XpvqQQCg3M0a+bTP2AEA\nBELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgB\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELY\nAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC\n2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAE\nQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEA\nBKJyqgeAcpSWlvbJa28v/c93Uz0IAJS7PYW7YvF4PNVjQHlZs2bN0qVLUz0FAFQQYQcAEAif\nsQMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAI\nhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIROVUDwDl6Lbbblu6dOnJJ5+c6kFCsGDBgry8vKysrFQP\nctTbsWPHp59+et5556V6kBB8/vnnu3fvbtKkSaoHCcHHH3+ck5Nz/PHHp3qQo15RUdHf/va3\n//qv/zruuOMq/uyu2BGyd955Z9WqVameIhAffvjhxo0bUz1FCL766qsPP/ww1VMEYvXq1cuX\nL0/1FIH4+OOP8/PzUz1FCLZt2zZ//vyvvvoqJWePxePxlJwYKkDXrl0bNmw4cuTIVA8SgoyM\njNdff/2iiy5K9SBHvZkzZ3bq1KmwsDDVg4Tglltu+eKLL15++eVUDxKCpk2b3nXXXb/85S9T\nPchRb/HixWedddaXX35Zp06dij+7K3YAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYA\nAIEQdgAAgRB2AACBEHYAAIFIGzJkSKpngPKSlpbWrFkzfyD8iNi7d2/79u2zs7NTPchRLzs7\nu0qVKm3atEn1ICHIyMg47bTTzjzzzFQPEoh27dqdeOKJqZ7iqFelSpXEvzArVUrB5TN/KxYA\nIBDeigUACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISw\nAwAIhLADAAiEsAMACISwAwAIhLADAAiEsOM7Z/Pmzf3792/cuHFGRsbJJ5/cs2fPdevWVfxZ\nKmaMCrBnz54777wzLS2tRYsW5XSKg6/V2LFjYwdy//33l9M85WHTpk233XZbo0aNMjMzmzRp\n0rlz5w8++OCIn+VYWMkoilauXPmrX/2qadOmmZmZtWvX7ty587x58474WY6RxSxpwIABsVis\nZ8+eR/zIwS9mhb2ECljJykd2YjhMu3fvbteu3V//+tfLL7/8vPPOW7FixfPPP/+f//mfCxYs\nOOGEEyrsLBUzRgVYsmRJ9+7dly1bVn6nOORabd68OYqiq6++umHDhiWf2LJly/Kb6sj66quv\nmjdvvmrVqvbt219//fUrV67885//PHPmzHnz5n3/+98/Umc5FlYyiqKlS5e2bNly27ZtV111\nVdOmTZcvXz5x4sQ33nhjzpw5P/7xj4/UWY6RxSzpL3/5y2OPPVYeRz4WFrNiXkIFrWQcvkv+\n7d/+LYqihx56KLnlz3/+cxRFAwcOLMPRGjVqdMAnHvIsR3aMVNmyZUtWVlaLFi2WLVuWmZnZ\nvHnzwzlamRfznnvuiaJo/vz5h3P21Lr55pujKHr88ceTWyZNmhRF0T/90z+V4WjH8krG4/GL\nLrooFovNmTMnuWXy5MlRFF111VVlONoxvphJe/bsadas2TnnnBNF0b/8y7+U7SDH8mIe2ZeQ\n2pUUdny3NGvWrFq1aoWFhSU3nnLKKXXq1Nm7d2/ibn5+/q9//euGDRump6fXqlWrU6dO8+bN\nO+DRvul/XYc8S2nG+O7buHHjwIEDd+/eHY/HvynsKmAx+/XrF0XRsmXLjsBLSpH+/fu3a9cu\nsZIJe/fuzcrKatSoUXKLlSyl3/72t3feeWfJLUVFRenp6eecc05yi8X8toYPHx6LxaZPn75/\n2FnM0ijNSzhaVtJn7PgOKSws/Nvf/vbDH/4wMzOz5PZWrVqtX7/+s88+i6Jow4YNP/rRj/70\npz9dffXVY8aMGTBgwIIFC1q3bj1nzpwjdZbSjHFUqFmz5u9+97v09PRv2qECFjP6x5sLNWrU\nKC4uXrt2bUFBwWG8ptR49NFH33rrrZIruXv37qKiogYNGiTuWsnSu++++4YNG1ZyS35+/p49\ne5o0aZK4azG/rRUrVtx77729evU6//zz93nIYpbSIV/CUbSSPmPHd8iaNWuKi4tzcnL22d6o\nUaMoilauXJmbm3vPPfd8/vnn77//fvKrAN27dz/rrLNuu+22+fPnR1G0fPny5BOLioo2b96c\n3JKdnV2vXr1DnqW4uPiQYxypl5xaFbCYubm5W7ZsiaJo5MiRTz755KZNm6IoOu200+65555r\nrrmm/F9iefnDH/6wZ8+ebt26Je5aybLZsWPHvHnz+vXrV61atbvuuiux0WJ+WzfddFONGjUe\nfPDBeDy+z0MWs5QO+RKOopUUdnyHbNu2LYqiqlWr7rM9Ozs78Wg8Hn/ppZfOPvvsBg0a5Ofn\nJx5NT0+/4IILZs6cuX379uOOO+7UU08t+dxnn3322WefTdzu1KnTK6+8csizHHKHI/BSvwMq\nZjGjf/w36Pjx43/zm9/Ur19/yZIlo0aNuvbaa7dt23bTTTeV86ssF3PmzPnXf/3XVq1a9erV\nK7KSZVWjRo3E/4117959ypQpif9espjf1tixY99+++2XX375+OOPT7yoJItZegd/CUfXSgo7\nvnNisdg+WxL/GRqLxdavX19QUFBQUHDSSSft/8T/+Z//OfPMM1966aXkll//+tfnn39+jx49\nEnfr169fmrOUcoejXYUt5t13392nT59LLrkk+W+07t27n3feeYMGDbrhhhsyMjKO6Msqd+PH\nj7/hhhu+973vTZ06tXLlypGVLKvevXt/9dVXH3/88Ysvvrhq1arnnnsuNzfXYn4r69evHzhw\nYIcOHS6//PIDPmoxS+ngL2HTpk1H0UoKO75DqlevHh3oktjWrVujKKpWrVrioWbNmj344IP7\nP/3kk0+OxWJXXHFFcsttt9122mmnldxSmrMccocyvLTvoIpZzCiKfvazn+3zaF5e3j/90z9N\nmTJl0aJFP/jBD47Ai6kQ8Xh8yJAhQ4cOveSSSyZOnJj8J8FKlk1yuWbPnt2hQ4cuXbp8+OGH\nFvNb6dev3+7du0eNGnXARy1m6R38JSR+i+RoWUlhx3dIw4YNK1euvHr16n22r1ixIoqiU089\nNfmZ00suuaT8zlKvXr2D71DmU3+nJLukXBfzm55Yp06dKIq2b99e5lNXsHg83rNnzzFjxvTt\n2/fRRx9NS0tLPmQlD1Pbtm07der04osvLl26tGbNmomNFvOQpk+fPmHChLvvvrtSpUpr166N\n/pEIO3bsWLt2bfXq1f2TeZiSLyH5q3JHxUr6VizfIRkZGc2bN583b96OHTuSG/fu3Ttnzpyc\nnJyGDRvWrVu3Vq1an3766T4fJdmwYcMRPMshdziMl/gdUjGLuX379tGjR48fP36fJ37yySfR\nPz41fFS49dZbx4wZM2zYsMcee6xk1UVW8tv4/PPPzznnnORbVEmFhYVRFH399dcWs/Tefvvt\nKIruu+++nH8466yzoigaP358Tk7OsGHDLGYpHfIlHGUreTi/lQJH3FNPPRVF0ZAhQ5JbRo8e\nHUXRvffem7jbu3fvKIoGDRqU3GH9+vX16tXr0KHD/kf7ph8TOuRZDrnDUeeAv2NXAYtZXFxc\nv3797OzsJUuWJHd45ZVXoig699xzD/NFVZjEzxH369fvm3awkqXXoEGDjIyMDz74ILll6dKl\n2dnZ2dnZO3fujFvMUlu8ePGr/9eECROiKPr5z3/+6quvJl6axSyN0ryEo2glhR3fLUVFRa1b\nt46iqFOnTvfee2+3bt1isdj3v//9r7/+OrHDl19+mbhmdsMNN4wdO3bYsGGJn4t88803j+BZ\nDrnDUWH27Nm3/0NaWlq9evWSdwsKCuIVtZhTp06N/b/27hjFQSAK43iGmakCMo2NwSpXsUkj\nsbMKAasQUm8RvIX3COQQooVnSGmljQcwxcASyJK4YbNE+f/qB/K+Qh7M+BRiPp8nSZKmaRRF\nQgjHcaqqekvbb7BcLmez2eFw+LrTtm1Pkr9xOp2klFrrOI6Px+N2u7X3xLMsswWE+TK7ION2\nQTFhDvS0hRElyWCHj9N1nf3butZ6sVjs9/umaW4L6rre7Xa+7yuljDFhGJZl+edPeVrw+X68\n52t9bzb/nzDzPF+tVsYYpZTneZvNZlxL6h8celwuF1tDksMVRbFer13XlVIaY4IgOJ/PtwWE\n+Zr7wa4nzMGetjCWJEX/8J0FAACAseDjCQAAgIlgsAMAAJgIBjsAAICJYLADAACYiCuwV2wV\nXleSbwAAAABJRU5ErkJggg=="
          },
          "metadata": {
            "image/png": {
              "width": 420,
              "height": 420
            }
          }
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "new_df2=new_df2 %>% drop_na()\n",
        "colSums(is.na(new_df))"
      ],
      "metadata": {
        "_uuid": "3358f81b-833e-47f2-aceb-381c4f81c265",
        "_cell_guid": "73aede12-feb6-4334-963e-fbb9fdec5e68",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "t4HxaOUJ0fkf",
        "outputId": "964e2586-1c87-41c8-fc94-a989acfd4238",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 72
        }
      },
      "execution_count": 32,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "tracemem[0x5c1b30165bd8 -> 0x5c1b3014dec8]: vec_detect_complete drop_na.data.frame drop_na %>% eval eval withVisible withCallingHandlers eval eval with_handlers doWithOneRestart withOneRestart withRestartList doWithOneRestart withOneRestart withRestartList withRestarts evaluate doTryCatch tryCatchOne tryCatchList doTryCatch tryCatchOne tryCatchList tryCatch <Anonymous> handle_shell <Anonymous> <Anonymous> \n"
          ]
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<style>\n",
              ".dl-inline {width: auto; margin:0; padding: 0}\n",
              ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
              ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
              ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
              "</style><dl class=dl-inline><dt>CustomerID</dt><dd>0</dd><dt>InvoiceNo</dt><dd>0</dd><dt>StockCode</dt><dd>0</dd><dt>Quantity</dt><dd>0</dd><dt>TotalAmount</dt><dd>0</dd><dt>InvoiceDate</dt><dd>0</dd><dt>Country</dt><dd>0</dd><dt>Year</dt><dd>0</dd></dl>\n"
            ],
            "text/markdown": "CustomerID\n:   0InvoiceNo\n:   0StockCode\n:   0Quantity\n:   0TotalAmount\n:   0InvoiceDate\n:   0Country\n:   0Year\n:   0\n\n",
            "text/latex": "\\begin{description*}\n\\item[CustomerID] 0\n\\item[InvoiceNo] 0\n\\item[StockCode] 0\n\\item[Quantity] 0\n\\item[TotalAmount] 0\n\\item[InvoiceDate] 0\n\\item[Country] 0\n\\item[Year] 0\n\\end{description*}\n",
            "text/plain": [
              " CustomerID   InvoiceNo   StockCode    Quantity TotalAmount InvoiceDate \n",
              "          0           0           0           0           0           0 \n",
              "    Country        Year \n",
              "          0           0 "
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "head(new_df2)"
      ],
      "metadata": {
        "_uuid": "d5166985-3c14-4116-92a1-950224bf868a",
        "_cell_guid": "214a564a-154b-4d9f-a609-96fb4877a084",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "a0hUOsHd0fkf",
        "outputId": "9437ef57-7fb0-4f9e-ddb6-25fcb6aa4c7b",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 286
        }
      },
      "execution_count": 33,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A tibble: 6 × 9</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>CustomerID</th><th scope=col>InvoiceNo</th><th scope=col>StockCode</th><th scope=col>Quantity</th><th scope=col>UnitPrice</th><th scope=col>Description</th><th scope=col>InvoiceDate</th><th scope=col>Country</th><th scope=col>TotalAmount</th></tr>\n",
              "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>17850</td><td>536365</td><td>85123A</td><td>6</td><td>2.55</td><td>WHITE HANGING HEART T-LIGHT HOLDER </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>15.30</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>71053 </td><td>6</td><td>3.39</td><td>WHITE METAL LANTERN                </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>20.34</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84406B</td><td>8</td><td>2.75</td><td>CREAM CUPID HEARTS COAT HANGER     </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>22.00</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029G</td><td>6</td><td>3.39</td><td>KNITTED UNION FLAG HOT WATER BOTTLE</td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>20.34</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>84029E</td><td>6</td><td>3.39</td><td>RED WOOLLY HOTTIE WHITE HEART.     </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>20.34</td></tr>\n",
              "\t<tr><td>17850</td><td>536365</td><td>22752 </td><td>2</td><td>7.65</td><td>SET 7 BABUSHKA NESTING BOXES       </td><td>2010-12-01 08:26:00</td><td>United Kingdom</td><td>15.30</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA tibble: 6 × 9\n\n| CustomerID &lt;dbl&gt; | InvoiceNo &lt;chr&gt; | StockCode &lt;chr&gt; | Quantity &lt;dbl&gt; | UnitPrice &lt;dbl&gt; | Description &lt;chr&gt; | InvoiceDate &lt;dttm&gt; | Country &lt;chr&gt; | TotalAmount &lt;dbl&gt; |\n|---|---|---|---|---|---|---|---|---|\n| 17850 | 536365 | 85123A | 6 | 2.55 | WHITE HANGING HEART T-LIGHT HOLDER  | 2010-12-01 08:26:00 | United Kingdom | 15.30 |\n| 17850 | 536365 | 71053  | 6 | 3.39 | WHITE METAL LANTERN                 | 2010-12-01 08:26:00 | United Kingdom | 20.34 |\n| 17850 | 536365 | 84406B | 8 | 2.75 | CREAM CUPID HEARTS COAT HANGER      | 2010-12-01 08:26:00 | United Kingdom | 22.00 |\n| 17850 | 536365 | 84029G | 6 | 3.39 | KNITTED UNION FLAG HOT WATER BOTTLE | 2010-12-01 08:26:00 | United Kingdom | 20.34 |\n| 17850 | 536365 | 84029E | 6 | 3.39 | RED WOOLLY HOTTIE WHITE HEART.      | 2010-12-01 08:26:00 | United Kingdom | 20.34 |\n| 17850 | 536365 | 22752  | 2 | 7.65 | SET 7 BABUSHKA NESTING BOXES        | 2010-12-01 08:26:00 | United Kingdom | 15.30 |\n\n",
            "text/latex": "A tibble: 6 × 9\n\\begin{tabular}{lllllllll}\n CustomerID & InvoiceNo & StockCode & Quantity & UnitPrice & Description & InvoiceDate & Country & TotalAmount\\\\\n <dbl> & <chr> & <chr> & <dbl> & <dbl> & <chr> & <dttm> & <chr> & <dbl>\\\\\n\\hline\n\t 17850 & 536365 & 85123A & 6 & 2.55 & WHITE HANGING HEART T-LIGHT HOLDER  & 2010-12-01 08:26:00 & United Kingdom & 15.30\\\\\n\t 17850 & 536365 & 71053  & 6 & 3.39 & WHITE METAL LANTERN                 & 2010-12-01 08:26:00 & United Kingdom & 20.34\\\\\n\t 17850 & 536365 & 84406B & 8 & 2.75 & CREAM CUPID HEARTS COAT HANGER      & 2010-12-01 08:26:00 & United Kingdom & 22.00\\\\\n\t 17850 & 536365 & 84029G & 6 & 3.39 & KNITTED UNION FLAG HOT WATER BOTTLE & 2010-12-01 08:26:00 & United Kingdom & 20.34\\\\\n\t 17850 & 536365 & 84029E & 6 & 3.39 & RED WOOLLY HOTTIE WHITE HEART.      & 2010-12-01 08:26:00 & United Kingdom & 20.34\\\\\n\t 17850 & 536365 & 22752  & 2 & 7.65 & SET 7 BABUSHKA NESTING BOXES        & 2010-12-01 08:26:00 & United Kingdom & 15.30\\\\\n\\end{tabular}\n",
            "text/plain": [
              "  CustomerID InvoiceNo StockCode Quantity UnitPrice\n",
              "1 17850      536365    85123A    6        2.55     \n",
              "2 17850      536365    71053     6        3.39     \n",
              "3 17850      536365    84406B    8        2.75     \n",
              "4 17850      536365    84029G    6        3.39     \n",
              "5 17850      536365    84029E    6        3.39     \n",
              "6 17850      536365    22752     2        7.65     \n",
              "  Description                         InvoiceDate         Country       \n",
              "1 WHITE HANGING HEART T-LIGHT HOLDER  2010-12-01 08:26:00 United Kingdom\n",
              "2 WHITE METAL LANTERN                 2010-12-01 08:26:00 United Kingdom\n",
              "3 CREAM CUPID HEARTS COAT HANGER      2010-12-01 08:26:00 United Kingdom\n",
              "4 KNITTED UNION FLAG HOT WATER BOTTLE 2010-12-01 08:26:00 United Kingdom\n",
              "5 RED WOOLLY HOTTIE WHITE HEART.      2010-12-01 08:26:00 United Kingdom\n",
              "6 SET 7 BABUSHKA NESTING BOXES        2010-12-01 08:26:00 United Kingdom\n",
              "  TotalAmount\n",
              "1 15.30      \n",
              "2 20.34      \n",
              "3 22.00      \n",
              "4 20.34      \n",
              "5 20.34      \n",
              "6 15.30      "
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "# Sales Average of each product\n",
        "\n",
        "avg_sales = new_df2 %>%\n",
        "  group_by(StockCode,Description) %>%\n",
        "  summarise(TotalAmount = mean(TotalAmount),Quantity = mean(Quantity))\n",
        "avg_sales = avg_sales[order(-avg_sales$Quantity),]\n",
        "avg_sales"
      ],
      "metadata": {
        "_uuid": "548eb02f-101f-49db-baac-24d44b974ba8",
        "_cell_guid": "a6c5e0ef-077c-4231-b8f7-110fbf7926c2",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "MVPS2bk10fkg",
        "outputId": "81805ad5-2894-4151-982e-b814b732fd78",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 1000
        }
      },
      "execution_count": 34,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "\u001b[1m\u001b[22m`summarise()` has regrouped the output.\n",
            "\u001b[36mℹ\u001b[39m Summaries were computed grouped by \u001b[34mStockCode\u001b[39m and \u001b[34mDescription\u001b[39m.\n",
            "\u001b[36mℹ\u001b[39m Output is grouped by \u001b[34mStockCode\u001b[39m.\n",
            "\u001b[36mℹ\u001b[39m Use `summarise(.groups = \"drop_last\")` to silence this message.\n",
            "\u001b[36mℹ\u001b[39m Use `summarise(.by = c(StockCode, Description))` for per-operation grouping\n",
            "  (`?dplyr::dplyr_by`) instead.\n"
          ]
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [
              "<table class=\"dataframe\">\n",
              "<caption>A grouped_df: 3913 × 4</caption>\n",
              "<thead>\n",
              "\t<tr><th scope=col>StockCode</th><th scope=col>Description</th><th scope=col>TotalAmount</th><th scope=col>Quantity</th></tr>\n",
              "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
              "</thead>\n",
              "<tbody>\n",
              "\t<tr><td>47556B</td><td>TEA TIME TEA TOWELS                </td><td>3022.500000</td><td>1300.00000</td></tr>\n",
              "\t<tr><td>84568 </td><td>GIRLS ALPHABET IRON ON PATCHES     </td><td>  97.200000</td><td> 520.00000</td></tr>\n",
              "\t<tr><td>84826 </td><td>ASSTD DESIGN 3D PAPER STICKERS     </td><td>   9.145405</td><td> 368.70270</td></tr>\n",
              "\t<tr><td>18007 </td><td>ESSENTIAL BALM 3.5g TIN IN ENVELOPE</td><td>  21.320000</td><td> 325.33333</td></tr>\n",
              "\t<tr><td>20914 </td><td>SET/5 RED SPOTTY LID GLASS BOWLS   </td><td> 734.400000</td><td> 288.00000</td></tr>\n",
              "\t<tr><td>16014 </td><td>SMALL CHINESE STYLE SCISSOR        </td><td>  80.291852</td><td> 246.81481</td></tr>\n",
              "\t<tr><td>23131 </td><td>MISELTOE HEART WREATH CREAM        </td><td> 996.000000</td><td> 240.00000</td></tr>\n",
              "\t<tr><td>16033 </td><td>MINI HIGHLIGHTER PENS              </td><td>  25.200000</td><td> 210.00000</td></tr>\n",
              "\t<tr><td>21897 </td><td>POTTING SHED CANDLE CITRONELLA     </td><td> 625.410000</td><td> 201.00000</td></tr>\n",
              "\t<tr><td>20725 </td><td>LUNCH BAG RED SPOTTY               </td><td> 290.000000</td><td> 200.00000</td></tr>\n",
              "\t<tr><td>17096 </td><td>ASSORTED LAQUERED INCENSE HOLDERS  </td><td>  34.135385</td><td> 193.53846</td></tr>\n",
              "\t<tr><td>22053 </td><td>EMPIRE DESIGN ROSETTE              </td><td> 138.323846</td><td> 162.92308</td></tr>\n",
              "\t<tr><td>84598 </td><td>BOYS ALPHABET IRON ON PATCHES      </td><td>  33.600000</td><td> 160.00000</td></tr>\n",
              "\t<tr><td>17084R</td><td>ASSORTED INCENSE PACK              </td><td>  28.160000</td><td> 149.33333</td></tr>\n",
              "\t<tr><td>16045 </td><td>POPART WOODEN PENCILS ASST         </td><td>   5.507246</td><td> 128.98551</td></tr>\n",
              "\t<tr><td>84077 </td><td>WORLD WAR 2 GLIDERS ASSTD DESIGNS  </td><td>  27.891904</td><td> 111.32845</td></tr>\n",
              "\t<tr><td>17003 </td><td>BROCADE RING PURSE                 </td><td>  27.392689</td><td> 108.30189</td></tr>\n",
              "\t<tr><td>16259 </td><td>PIECE OF CAMO STATIONERY SET       </td><td>   9.935000</td><td> 102.25000</td></tr>\n",
              "\t<tr><td>16049 </td><td>TEATIME GEL PENS ASST              </td><td>  16.416000</td><td> 100.80000</td></tr>\n",
              "\t<tr><td>22896 </td><td>PEG BAG APPLE DESIGN               </td><td> 210.000000</td><td> 100.00000</td></tr>\n",
              "\t<tr><td>84212 </td><td>ASSORTED FLOWER COLOUR \"LEIS\"      </td><td>  47.295631</td><td>  99.97087</td></tr>\n",
              "\t<tr><td>21785 </td><td>RAIN PONCHO                        </td><td>  53.590000</td><td>  82.20000</td></tr>\n",
              "\t<tr><td>16216 </td><td>LETTER SHAPE PENCIL SHARPENER      </td><td>   5.540000</td><td>  80.87805</td></tr>\n",
              "\t<tr><td>17038 </td><td>PORCELAIN BUDAH INCENSE HOLDER     </td><td>   7.268421</td><td>  79.00000</td></tr>\n",
              "\t<tr><td>16052 </td><td>TEATIME PUSH DOWN RUBBER           </td><td>  17.548333</td><td>  77.83333</td></tr>\n",
              "\t<tr><td>22492 </td><td>MINI PAINT SET VINTAGE             </td><td>  47.498030</td><td>  77.25373</td></tr>\n",
              "\t<tr><td>79164 </td><td>BLACK WINE GLASS                   </td><td>  31.591364</td><td>  75.86364</td></tr>\n",
              "\t<tr><td>16218 </td><td>CARTOON  PENCIL SHARPENERS         </td><td>   5.064000</td><td>  75.20000</td></tr>\n",
              "\t<tr><td>62018 </td><td>SOMBRERO                           </td><td>  96.466102</td><td>  74.61017</td></tr>\n",
              "\t<tr><td>40016 </td><td>CHINESE DRAGON PAPER LANTERNS      </td><td>  24.942667</td><td>  73.65333</td></tr>\n",
              "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
              "\t<tr><td>90177E</td><td>DROP DIAMANTE EARRINGS GREEN       </td><td>   0.000000</td><td>  0.0000000</td></tr>\n",
              "\t<tr><td>90182C</td><td>BLACK 3 BEAD DROP EARRINGS         </td><td>   0.000000</td><td>  0.0000000</td></tr>\n",
              "\t<tr><td>90202A</td><td>PURPLE ENAMEL FLOWER HAIR TIE      </td><td>   0.000000</td><td>  0.0000000</td></tr>\n",
              "\t<tr><td>35400 </td><td>WOODEN BOX ADVENT CALENDAR         </td><td>  -3.515385</td><td> -0.4615385</td></tr>\n",
              "\t<tr><td>22769 </td><td>CHALKBOARD KITCHEN ORGANISER       </td><td> -17.560000</td><td> -0.8000000</td></tr>\n",
              "\t<tr><td>20957 </td><td>PORCELAIN HANGING BELL SMALL       </td><td>  -1.450000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>35832 </td><td>WOOLLY HAT SOCK GLOVE ADVENT STRING</td><td>  -2.950000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>37503 </td><td>TEA TIME CAKE STAND IN GIFT BOX    </td><td> -10.750000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>72815 </td><td>3 WICK CHRISTMAS BRIAR CANDLE      </td><td>  -3.750000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>79320 </td><td>FLAMINGO LIGHTS                    </td><td>  -4.950000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>84750A</td><td>PINK SMALL GLASS CAKE STAND        </td><td>  -1.950000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>84839 </td><td>SWEETHEART KEY CABINET             </td><td>  -5.550000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>84856S</td><td>SMALL TAHITI BEACH BAG             </td><td>  -3.810000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>85023C</td><td>PINK LARGE JEWELED PHOTOFRAME      </td><td>  -2.550000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>85065 </td><td>CREAM SWEETHEART TRAYS             </td><td> -12.750000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>85068 </td><td>CREAM SWEETHEART SHELF + HOOKS     </td><td>  -7.950000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>85098B</td><td>BLUE FLYING SINGING CANARY         </td><td>  -3.750000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>85126 </td><td>LARGE ROUND CUTGLASS CANDLESTICK   </td><td>  -6.750000</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>CRUK  </td><td>CRUK Commission                    </td><td>-495.839375</td><td> -1.0000000</td></tr>\n",
              "\t<tr><td>79323P</td><td>PINK CHERRY LIGHTS                 </td><td>  -9.000000</td><td> -1.3333333</td></tr>\n",
              "\t<tr><td>20703 </td><td>BLUE PADDED SOFT MOBILE            </td><td>  -6.375000</td><td> -1.5000000</td></tr>\n",
              "\t<tr><td>85042 </td><td>ANTIQUE LILY FAIRY LIGHTS          </td><td>  -7.425000</td><td> -1.5000000</td></tr>\n",
              "\t<tr><td>85063 </td><td>CREAM SWEETHEART MAGAZINE RACK     </td><td> -23.425000</td><td> -1.5000000</td></tr>\n",
              "\t<tr><td>84347 </td><td>ROTATING SILVER ANGELS T-LIGHT HLDR</td><td>  52.405667</td><td> -4.4242424</td></tr>\n",
              "\t<tr><td>22034 </td><td>ROBIN CHRISTMAS CARD               </td><td>  -1.890000</td><td> -4.5000000</td></tr>\n",
              "\t<tr><td>21412 </td><td>VINTAGE GOLD TINSEL REEL           </td><td>  -2.520000</td><td> -6.0000000</td></tr>\n",
              "\t<tr><td>79323W</td><td>WHITE CHERRY LIGHTS                </td><td> -54.000000</td><td> -8.0000000</td></tr>\n",
              "\t<tr><td>21144 </td><td>PINK POODLE HANGING DECORATION     </td><td>  -4.560000</td><td>-12.0000000</td></tr>\n",
              "\t<tr><td>D     </td><td>Discount                           </td><td> -73.976883</td><td>-15.5064935</td></tr>\n",
              "\t<tr><td>21645 </td><td>ASSORTED TUTTI FRUTTI ROUND BOX    </td><td> -39.600000</td><td>-24.0000000</td></tr>\n",
              "</tbody>\n",
              "</table>\n"
            ],
            "text/markdown": "\nA grouped_df: 3913 × 4\n\n| StockCode &lt;chr&gt; | Description &lt;chr&gt; | TotalAmount &lt;dbl&gt; | Quantity &lt;dbl&gt; |\n|---|---|---|---|\n| 47556B | TEA TIME TEA TOWELS                 | 3022.500000 | 1300.00000 |\n| 84568  | GIRLS ALPHABET IRON ON PATCHES      |   97.200000 |  520.00000 |\n| 84826  | ASSTD DESIGN 3D PAPER STICKERS      |    9.145405 |  368.70270 |\n| 18007  | ESSENTIAL BALM 3.5g TIN IN ENVELOPE |   21.320000 |  325.33333 |\n| 20914  | SET/5 RED SPOTTY LID GLASS BOWLS    |  734.400000 |  288.00000 |\n| 16014  | SMALL CHINESE STYLE SCISSOR         |   80.291852 |  246.81481 |\n| 23131  | MISELTOE HEART WREATH CREAM         |  996.000000 |  240.00000 |\n| 16033  | MINI HIGHLIGHTER PENS               |   25.200000 |  210.00000 |\n| 21897  | POTTING SHED CANDLE CITRONELLA      |  625.410000 |  201.00000 |\n| 20725  | LUNCH BAG RED SPOTTY                |  290.000000 |  200.00000 |\n| 17096  | ASSORTED LAQUERED INCENSE HOLDERS   |   34.135385 |  193.53846 |\n| 22053  | EMPIRE DESIGN ROSETTE               |  138.323846 |  162.92308 |\n| 84598  | BOYS ALPHABET IRON ON PATCHES       |   33.600000 |  160.00000 |\n| 17084R | ASSORTED INCENSE PACK               |   28.160000 |  149.33333 |\n| 16045  | POPART WOODEN PENCILS ASST          |    5.507246 |  128.98551 |\n| 84077  | WORLD WAR 2 GLIDERS ASSTD DESIGNS   |   27.891904 |  111.32845 |\n| 17003  | BROCADE RING PURSE                  |   27.392689 |  108.30189 |\n| 16259  | PIECE OF CAMO STATIONERY SET        |    9.935000 |  102.25000 |\n| 16049  | TEATIME GEL PENS ASST               |   16.416000 |  100.80000 |\n| 22896  | PEG BAG APPLE DESIGN                |  210.000000 |  100.00000 |\n| 84212  | ASSORTED FLOWER COLOUR \"LEIS\"       |   47.295631 |   99.97087 |\n| 21785  | RAIN PONCHO                         |   53.590000 |   82.20000 |\n| 16216  | LETTER SHAPE PENCIL SHARPENER       |    5.540000 |   80.87805 |\n| 17038  | PORCELAIN BUDAH INCENSE HOLDER      |    7.268421 |   79.00000 |\n| 16052  | TEATIME PUSH DOWN RUBBER            |   17.548333 |   77.83333 |\n| 22492  | MINI PAINT SET VINTAGE              |   47.498030 |   77.25373 |\n| 79164  | BLACK WINE GLASS                    |   31.591364 |   75.86364 |\n| 16218  | CARTOON  PENCIL SHARPENERS          |    5.064000 |   75.20000 |\n| 62018  | SOMBRERO                            |   96.466102 |   74.61017 |\n| 40016  | CHINESE DRAGON PAPER LANTERNS       |   24.942667 |   73.65333 |\n| ⋮ | ⋮ | ⋮ | ⋮ |\n| 90177E | DROP DIAMANTE EARRINGS GREEN        |    0.000000 |   0.0000000 |\n| 90182C | BLACK 3 BEAD DROP EARRINGS          |    0.000000 |   0.0000000 |\n| 90202A | PURPLE ENAMEL FLOWER HAIR TIE       |    0.000000 |   0.0000000 |\n| 35400  | WOODEN BOX ADVENT CALENDAR          |   -3.515385 |  -0.4615385 |\n| 22769  | CHALKBOARD KITCHEN ORGANISER        |  -17.560000 |  -0.8000000 |\n| 20957  | PORCELAIN HANGING BELL SMALL        |   -1.450000 |  -1.0000000 |\n| 35832  | WOOLLY HAT SOCK GLOVE ADVENT STRING |   -2.950000 |  -1.0000000 |\n| 37503  | TEA TIME CAKE STAND IN GIFT BOX     |  -10.750000 |  -1.0000000 |\n| 72815  | 3 WICK CHRISTMAS BRIAR CANDLE       |   -3.750000 |  -1.0000000 |\n| 79320  | FLAMINGO LIGHTS                     |   -4.950000 |  -1.0000000 |\n| 84750A | PINK SMALL GLASS CAKE STAND         |   -1.950000 |  -1.0000000 |\n| 84839  | SWEETHEART KEY CABINET              |   -5.550000 |  -1.0000000 |\n| 84856S | SMALL TAHITI BEACH BAG              |   -3.810000 |  -1.0000000 |\n| 85023C | PINK LARGE JEWELED PHOTOFRAME       |   -2.550000 |  -1.0000000 |\n| 85065  | CREAM SWEETHEART TRAYS              |  -12.750000 |  -1.0000000 |\n| 85068  | CREAM SWEETHEART SHELF + HOOKS      |   -7.950000 |  -1.0000000 |\n| 85098B | BLUE FLYING SINGING CANARY          |   -3.750000 |  -1.0000000 |\n| 85126  | LARGE ROUND CUTGLASS CANDLESTICK    |   -6.750000 |  -1.0000000 |\n| CRUK   | CRUK Commission                     | -495.839375 |  -1.0000000 |\n| 79323P | PINK CHERRY LIGHTS                  |   -9.000000 |  -1.3333333 |\n| 20703  | BLUE PADDED SOFT MOBILE             |   -6.375000 |  -1.5000000 |\n| 85042  | ANTIQUE LILY FAIRY LIGHTS           |   -7.425000 |  -1.5000000 |\n| 85063  | CREAM SWEETHEART MAGAZINE RACK      |  -23.425000 |  -1.5000000 |\n| 84347  | ROTATING SILVER ANGELS T-LIGHT HLDR |   52.405667 |  -4.4242424 |\n| 22034  | ROBIN CHRISTMAS CARD                |   -1.890000 |  -4.5000000 |\n| 21412  | VINTAGE GOLD TINSEL REEL            |   -2.520000 |  -6.0000000 |\n| 79323W | WHITE CHERRY LIGHTS                 |  -54.000000 |  -8.0000000 |\n| 21144  | PINK POODLE HANGING DECORATION      |   -4.560000 | -12.0000000 |\n| D      | Discount                            |  -73.976883 | -15.5064935 |\n| 21645  | ASSORTED TUTTI FRUTTI ROUND BOX     |  -39.600000 | -24.0000000 |\n\n",
            "text/latex": "A grouped\\_df: 3913 × 4\n\\begin{tabular}{llll}\n StockCode & Description & TotalAmount & Quantity\\\\\n <chr> & <chr> & <dbl> & <dbl>\\\\\n\\hline\n\t 47556B & TEA TIME TEA TOWELS                 & 3022.500000 & 1300.00000\\\\\n\t 84568  & GIRLS ALPHABET IRON ON PATCHES      &   97.200000 &  520.00000\\\\\n\t 84826  & ASSTD DESIGN 3D PAPER STICKERS      &    9.145405 &  368.70270\\\\\n\t 18007  & ESSENTIAL BALM 3.5g TIN IN ENVELOPE &   21.320000 &  325.33333\\\\\n\t 20914  & SET/5 RED SPOTTY LID GLASS BOWLS    &  734.400000 &  288.00000\\\\\n\t 16014  & SMALL CHINESE STYLE SCISSOR         &   80.291852 &  246.81481\\\\\n\t 23131  & MISELTOE HEART WREATH CREAM         &  996.000000 &  240.00000\\\\\n\t 16033  & MINI HIGHLIGHTER PENS               &   25.200000 &  210.00000\\\\\n\t 21897  & POTTING SHED CANDLE CITRONELLA      &  625.410000 &  201.00000\\\\\n\t 20725  & LUNCH BAG RED SPOTTY                &  290.000000 &  200.00000\\\\\n\t 17096  & ASSORTED LAQUERED INCENSE HOLDERS   &   34.135385 &  193.53846\\\\\n\t 22053  & EMPIRE DESIGN ROSETTE               &  138.323846 &  162.92308\\\\\n\t 84598  & BOYS ALPHABET IRON ON PATCHES       &   33.600000 &  160.00000\\\\\n\t 17084R & ASSORTED INCENSE PACK               &   28.160000 &  149.33333\\\\\n\t 16045  & POPART WOODEN PENCILS ASST          &    5.507246 &  128.98551\\\\\n\t 84077  & WORLD WAR 2 GLIDERS ASSTD DESIGNS   &   27.891904 &  111.32845\\\\\n\t 17003  & BROCADE RING PURSE                  &   27.392689 &  108.30189\\\\\n\t 16259  & PIECE OF CAMO STATIONERY SET        &    9.935000 &  102.25000\\\\\n\t 16049  & TEATIME GEL PENS ASST               &   16.416000 &  100.80000\\\\\n\t 22896  & PEG BAG APPLE DESIGN                &  210.000000 &  100.00000\\\\\n\t 84212  & ASSORTED FLOWER COLOUR \"LEIS\"       &   47.295631 &   99.97087\\\\\n\t 21785  & RAIN PONCHO                         &   53.590000 &   82.20000\\\\\n\t 16216  & LETTER SHAPE PENCIL SHARPENER       &    5.540000 &   80.87805\\\\\n\t 17038  & PORCELAIN BUDAH INCENSE HOLDER      &    7.268421 &   79.00000\\\\\n\t 16052  & TEATIME PUSH DOWN RUBBER            &   17.548333 &   77.83333\\\\\n\t 22492  & MINI PAINT SET VINTAGE              &   47.498030 &   77.25373\\\\\n\t 79164  & BLACK WINE GLASS                    &   31.591364 &   75.86364\\\\\n\t 16218  & CARTOON  PENCIL SHARPENERS          &    5.064000 &   75.20000\\\\\n\t 62018  & SOMBRERO                            &   96.466102 &   74.61017\\\\\n\t 40016  & CHINESE DRAGON PAPER LANTERNS       &   24.942667 &   73.65333\\\\\n\t ⋮ & ⋮ & ⋮ & ⋮\\\\\n\t 90177E & DROP DIAMANTE EARRINGS GREEN        &    0.000000 &   0.0000000\\\\\n\t 90182C & BLACK 3 BEAD DROP EARRINGS          &    0.000000 &   0.0000000\\\\\n\t 90202A & PURPLE ENAMEL FLOWER HAIR TIE       &    0.000000 &   0.0000000\\\\\n\t 35400  & WOODEN BOX ADVENT CALENDAR          &   -3.515385 &  -0.4615385\\\\\n\t 22769  & CHALKBOARD KITCHEN ORGANISER        &  -17.560000 &  -0.8000000\\\\\n\t 20957  & PORCELAIN HANGING BELL SMALL        &   -1.450000 &  -1.0000000\\\\\n\t 35832  & WOOLLY HAT SOCK GLOVE ADVENT STRING &   -2.950000 &  -1.0000000\\\\\n\t 37503  & TEA TIME CAKE STAND IN GIFT BOX     &  -10.750000 &  -1.0000000\\\\\n\t 72815  & 3 WICK CHRISTMAS BRIAR CANDLE       &   -3.750000 &  -1.0000000\\\\\n\t 79320  & FLAMINGO LIGHTS                     &   -4.950000 &  -1.0000000\\\\\n\t 84750A & PINK SMALL GLASS CAKE STAND         &   -1.950000 &  -1.0000000\\\\\n\t 84839  & SWEETHEART KEY CABINET              &   -5.550000 &  -1.0000000\\\\\n\t 84856S & SMALL TAHITI BEACH BAG              &   -3.810000 &  -1.0000000\\\\\n\t 85023C & PINK LARGE JEWELED PHOTOFRAME       &   -2.550000 &  -1.0000000\\\\\n\t 85065  & CREAM SWEETHEART TRAYS              &  -12.750000 &  -1.0000000\\\\\n\t 85068  & CREAM SWEETHEART SHELF + HOOKS      &   -7.950000 &  -1.0000000\\\\\n\t 85098B & BLUE FLYING SINGING CANARY          &   -3.750000 &  -1.0000000\\\\\n\t 85126  & LARGE ROUND CUTGLASS CANDLESTICK    &   -6.750000 &  -1.0000000\\\\\n\t CRUK   & CRUK Commission                     & -495.839375 &  -1.0000000\\\\\n\t 79323P & PINK CHERRY LIGHTS                  &   -9.000000 &  -1.3333333\\\\\n\t 20703  & BLUE PADDED SOFT MOBILE             &   -6.375000 &  -1.5000000\\\\\n\t 85042  & ANTIQUE LILY FAIRY LIGHTS           &   -7.425000 &  -1.5000000\\\\\n\t 85063  & CREAM SWEETHEART MAGAZINE RACK      &  -23.425000 &  -1.5000000\\\\\n\t 84347  & ROTATING SILVER ANGELS T-LIGHT HLDR &   52.405667 &  -4.4242424\\\\\n\t 22034  & ROBIN CHRISTMAS CARD                &   -1.890000 &  -4.5000000\\\\\n\t 21412  & VINTAGE GOLD TINSEL REEL            &   -2.520000 &  -6.0000000\\\\\n\t 79323W & WHITE CHERRY LIGHTS                 &  -54.000000 &  -8.0000000\\\\\n\t 21144  & PINK POODLE HANGING DECORATION      &   -4.560000 & -12.0000000\\\\\n\t D      & Discount                            &  -73.976883 & -15.5064935\\\\\n\t 21645  & ASSORTED TUTTI FRUTTI ROUND BOX     &  -39.600000 & -24.0000000\\\\\n\\end{tabular}\n",
            "text/plain": [
              "     StockCode Description                         TotalAmount Quantity   \n",
              "1    47556B    TEA TIME TEA TOWELS                 3022.500000 1300.00000 \n",
              "2    84568     GIRLS ALPHABET IRON ON PATCHES        97.200000  520.00000 \n",
              "3    84826     ASSTD DESIGN 3D PAPER STICKERS         9.145405  368.70270 \n",
              "4    18007     ESSENTIAL BALM 3.5g TIN IN ENVELOPE   21.320000  325.33333 \n",
              "5    20914     SET/5 RED SPOTTY LID GLASS BOWLS     734.400000  288.00000 \n",
              "6    16014     SMALL CHINESE STYLE SCISSOR           80.291852  246.81481 \n",
              "7    23131     MISELTOE HEART WREATH CREAM          996.000000  240.00000 \n",
              "8    16033     MINI HIGHLIGHTER PENS                 25.200000  210.00000 \n",
              "9    21897     POTTING SHED CANDLE CITRONELLA       625.410000  201.00000 \n",
              "10   20725     LUNCH BAG RED SPOTTY                 290.000000  200.00000 \n",
              "11   17096     ASSORTED LAQUERED INCENSE HOLDERS     34.135385  193.53846 \n",
              "12   22053     EMPIRE DESIGN ROSETTE                138.323846  162.92308 \n",
              "13   84598     BOYS ALPHABET IRON ON PATCHES         33.600000  160.00000 \n",
              "14   17084R    ASSORTED INCENSE PACK                 28.160000  149.33333 \n",
              "15   16045     POPART WOODEN PENCILS ASST             5.507246  128.98551 \n",
              "16   84077     WORLD WAR 2 GLIDERS ASSTD DESIGNS     27.891904  111.32845 \n",
              "17   17003     BROCADE RING PURSE                    27.392689  108.30189 \n",
              "18   16259     PIECE OF CAMO STATIONERY SET           9.935000  102.25000 \n",
              "19   16049     TEATIME GEL PENS ASST                 16.416000  100.80000 \n",
              "20   22896     PEG BAG APPLE DESIGN                 210.000000  100.00000 \n",
              "21   84212     ASSORTED FLOWER COLOUR \"LEIS\"         47.295631   99.97087 \n",
              "22   21785     RAIN PONCHO                           53.590000   82.20000 \n",
              "23   16216     LETTER SHAPE PENCIL SHARPENER          5.540000   80.87805 \n",
              "24   17038     PORCELAIN BUDAH INCENSE HOLDER         7.268421   79.00000 \n",
              "25   16052     TEATIME PUSH DOWN RUBBER              17.548333   77.83333 \n",
              "26   22492     MINI PAINT SET VINTAGE                47.498030   77.25373 \n",
              "27   79164     BLACK WINE GLASS                      31.591364   75.86364 \n",
              "28   16218     CARTOON  PENCIL SHARPENERS             5.064000   75.20000 \n",
              "29   62018     SOMBRERO                              96.466102   74.61017 \n",
              "30   40016     CHINESE DRAGON PAPER LANTERNS         24.942667   73.65333 \n",
              "⋮    ⋮         ⋮                                   ⋮           ⋮          \n",
              "3884 90177E    DROP DIAMANTE EARRINGS GREEN           0.000000   0.0000000\n",
              "3885 90182C    BLACK 3 BEAD DROP EARRINGS             0.000000   0.0000000\n",
              "3886 90202A    PURPLE ENAMEL FLOWER HAIR TIE          0.000000   0.0000000\n",
              "3887 35400     WOODEN BOX ADVENT CALENDAR            -3.515385  -0.4615385\n",
              "3888 22769     CHALKBOARD KITCHEN ORGANISER         -17.560000  -0.8000000\n",
              "3889 20957     PORCELAIN HANGING BELL SMALL          -1.450000  -1.0000000\n",
              "3890 35832     WOOLLY HAT SOCK GLOVE ADVENT STRING   -2.950000  -1.0000000\n",
              "3891 37503     TEA TIME CAKE STAND IN GIFT BOX      -10.750000  -1.0000000\n",
              "3892 72815     3 WICK CHRISTMAS BRIAR CANDLE         -3.750000  -1.0000000\n",
              "3893 79320     FLAMINGO LIGHTS                       -4.950000  -1.0000000\n",
              "3894 84750A    PINK SMALL GLASS CAKE STAND           -1.950000  -1.0000000\n",
              "3895 84839     SWEETHEART KEY CABINET                -5.550000  -1.0000000\n",
              "3896 84856S    SMALL TAHITI BEACH BAG                -3.810000  -1.0000000\n",
              "3897 85023C    PINK LARGE JEWELED PHOTOFRAME         -2.550000  -1.0000000\n",
              "3898 85065     CREAM SWEETHEART TRAYS               -12.750000  -1.0000000\n",
              "3899 85068     CREAM SWEETHEART SHELF + HOOKS        -7.950000  -1.0000000\n",
              "3900 85098B    BLUE FLYING SINGING CANARY            -3.750000  -1.0000000\n",
              "3901 85126     LARGE ROUND CUTGLASS CANDLESTICK      -6.750000  -1.0000000\n",
              "3902 CRUK      CRUK Commission                     -495.839375  -1.0000000\n",
              "3903 79323P    PINK CHERRY LIGHTS                    -9.000000  -1.3333333\n",
              "3904 20703     BLUE PADDED SOFT MOBILE               -6.375000  -1.5000000\n",
              "3905 85042     ANTIQUE LILY FAIRY LIGHTS             -7.425000  -1.5000000\n",
              "3906 85063     CREAM SWEETHEART MAGAZINE RACK       -23.425000  -1.5000000\n",
              "3907 84347     ROTATING SILVER ANGELS T-LIGHT HLDR   52.405667  -4.4242424\n",
              "3908 22034     ROBIN CHRISTMAS CARD                  -1.890000  -4.5000000\n",
              "3909 21412     VINTAGE GOLD TINSEL REEL              -2.520000  -6.0000000\n",
              "3910 79323W    WHITE CHERRY LIGHTS                  -54.000000  -8.0000000\n",
              "3911 21144     PINK POODLE HANGING DECORATION        -4.560000 -12.0000000\n",
              "3912 D         Discount                             -73.976883 -15.5064935\n",
              "3913 21645     ASSORTED TUTTI FRUTTI ROUND BOX      -39.600000 -24.0000000"
            ]
          },
          "metadata": {}
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [],
      "metadata": {
        "_uuid": "f3a360d7-2bd3-4a98-9d5b-27d8a2f16d00",
        "_cell_guid": "72e23144-dfee-4857-96e7-c2c1a851214d",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "67QEUYfD0fkg"
      },
      "execution_count": 35,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [],
      "metadata": {
        "_uuid": "f7b9852c-9074-45b3-b6c7-d38f457febe8",
        "_cell_guid": "46d8b0f9-85a3-475d-a5ec-a20340047970",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "KV_aeTMw0fkg"
      },
      "execution_count": 36,
      "outputs": []
    }
  ]
}