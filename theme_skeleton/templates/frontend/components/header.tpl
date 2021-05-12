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
				<a class="navbar-brand" href="."><img alt="Kungliga bibliotekets logotyp" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"> {$displayPageHeaderTitle|escape}</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 d-flex justify-content-end">
						{if isset($supportedLocales) && $supportedLocales|@count}
								{foreach from=$supportedLocales item=localeName key=localeKey}
									{if $localeKey != $currentLocale}
										<li class="nav-item">
											<a class="nav-link" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey}">
												{$localeName}
											</a>
										</li>
									{/if}
								{/foreach}
						{/if}
						<!-- <li class="nav-item">
							<a class="nav-link active" aria-current="page" href="#">Home</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">Link</a>
						</li> -->
						{$primaryMenu}
						{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
					</ul>
				</div>

			</div>
		</nav>
		<header class="pkp_structure_head publicera-header text-white" id="headerNavigationContainer" role="banner">

			<div class="pkp_head_wrapper container">
				<div class="row justify-content-center py-4">
					<div class="pkp_site_name_wrapper col-md-6 text-center my-4">
						<h1>
							Välkommen<br/>till Publicera!
						</h1>
						<p class="lead">
							En nationell digital plattform för öppet tillgängliga svenska vetenskapliga tidsskrifter.
						</p>
						<div class="pkp_site_name">
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
					</div>

					{capture assign="primaryMenu"}
						{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
					{/capture}
				</div>
			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div class="pkp_structure_main container" role="main">
				<a id="pkp_content_main"></a>
