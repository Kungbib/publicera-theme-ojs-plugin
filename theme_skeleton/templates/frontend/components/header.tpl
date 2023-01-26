{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="pkp_structure_page">

		{* Header *}
		<nav class="pkp_site_nav_menu navbar navbar-expand-lg" aria-label="{translate|escape key="common.navigation.site"}">
			<div class="container">
				<a class="navbar-brand" href=".">
					<img aria-hidden="true" alt="{translate key="plugins.themes.publicera_theme.site.logotypeAlt"}" src="{$imageAssetPath}/kb_logo_black.svg" />
					<!-- DISABLING BUILT IN LOGO-CHOOSER <img {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"> -->
					{$displayPageHeaderTitle|escape}
				</a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						{if isset($supportedLocales) && $supportedLocales|@count}
							{foreach from=$supportedLocales item=localeName key=localeKey}
								{if $localeKey != $currentLocale && ($localeKey == 'en_US' || $localeKey == 'sv_SE')}
									<li class="nav-item">
										<a class="nav-link" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey}">
											{$localeName}
										</a>
									</li>
								{/if}
							{/foreach}
						{/if}

						{$primaryMenu}

						{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
					</ul>
				</div>

			</div>
		</nav>
		<header class="pkp_structure_head publicera-header text-white" id="headerNavigationContainer" role="banner">
			<div>
				<div class="pkp_head_wrapper container">
					<div class="row justify-content-center py-4">
						<div class="pkp_site_name_wrapper col-md-8 col-lg-6 text-center my-2">
							{if $requestedPage == '' || $requestedPage == 'index' }
								{* Welcome header *}
								<h1>
									{translate key="plugins.themes.publicera_theme.jumbotron_header"}
								</h1>
								<p class="lead">
									{translate key="plugins.themes.publicera_theme.jumbotron_lead"}
								</p>
							{else}
								{* Breadcrumbs header *}
								{if isset($translatedPageTitle)}
									{include file="frontend/components/breadcrumbs.tpl" currentTitle="{$translatedPageTitle}"}
								{else}
									{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="{$pageTitle}"}
								{/if}
							{/if}
							{capture assign="homeUrl"}
								{url page="index" router=$smarty.const.ROUTE_PAGE}
							{/capture}
							{* Search form *}
							{if $currentContext && $requestedPage !== 'search'}
								<div class="pkp_navigation_search_wrapper">
									<a href="{url page="search"}" class="pkp_search pkp_search_desktop">
										<span class="fa fa-search" aria-hidden="true"></span>
										{translate key="common.search"}
									</a>
								</div>
							{/if}
						</div>
						{if $about}
						<div class="row justify-content-center">
							<p class="text-center">
								<a data-bs-target="#collapseAbout" href="#" class="text-white" data-bs-toggle="collapse" role="button">
									{translate key="plugins.themes.publicera_theme.jumbotron_about_link"}
									<i class="kbico-circle-arrow-down rotate" id="collapseAboutIcon"></i>
								</a>
							</p>
						</div>
						{/if}
					</div>
				</div><!-- .pkp_head_wrapper -->
				</div>
				<div class="darkened-overlay collapse" id="collapseAbout">
				{if $requestedPage == '' || $requestedPage == 'index' }
					{if $about}
					<div class="container">
							<div class="row justify-content-center py-4">
								<div class="col col-sm-12 col-md-10 col-lg-8 col-xl-6 header-about">
								{$about|nl2br}
								</div>
							</div>
					</div>
					{/if}
				{/if}
				</div>
				<div>
			<div>
		</header><!-- .pkp_structure_head -->
		{if $requestedPage == '' || $requestedPage == 'index' || $requestedPage == 'search' }
		<div class="container">
			<div class="row justify-content-center">
				{include file="frontend/components/headerSearch.tpl"}
			</div>
		</div>
		{/if}

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div class="pkp_structure_main container" role="main">
				<a id="pkp_content_main"></a>
