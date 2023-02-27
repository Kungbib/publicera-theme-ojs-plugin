{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</div><!-- pkp_structure_main -->

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<div class="pkp_structure_sidebar left" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				{$sidebarCode}
			</div><!-- pkp_sidebar.left -->
		{/if}
	{/if}
</div><!-- pkp_structure_content -->

<footer class="pkp_structure_footer_wrapper bg-dark text-light" role="contentinfo">
	<a id="pkp_content_footer"></a>

	<div class="pkp_structure_footer container py-4">
		<div class="row d-flex justify-content-center">
			<div class="logo col col-4 col-md-2 text-center">
				<img src="{$imageAssetPath}/kb_logo_text_white.svg" alt="{translate key="plugins.themes.publicera_theme.site.logotypeAlt"}" />
			</div>

			<div class="logo col col-12 col-md-1"></div>

			{if $pageFooter}
				<div class="col col-12 col-md-9">
					<div class="row d-flex mt-5 mt-md-0 mb-5">
						<div class="d-flex justify-content-center align-items-center col col-6 col-lg-3 text-center mb-2 mb-lg-0">
							<a href="https://www.crossref.org/" target="_blank">
								<img src="{$imageAssetPath}/crossref_logo.svg" class="px-5 py-2 py-lg-2 px-lg-3 align-self-center" style="height: 70px" alt="Crossref logo" />
							</a>
						</div>

						<div class="d-flex justify-content-center align-items-center col col-6 col-lg-3 text-center mb-2 mb-lg-0">
							<a href="https://doaj.org/" target="_blank">
								<img src="{$imageAssetPath}doaj_logo.png" class="px-5 py-2 py-lg-2 px-lg-3 align-self-center" style="height: 45px" />
							</a>
						</div>

						<div class="d-flex justify-content-center align-items-center col col-6 col-lg-3 text-center mb-2 mb-lg-0">
							<a href="https://oaspa.org/" target="_blank">
								<img src="{$imageAssetPath}oaspa_logo.png" class="px-5 py-2 py-lg-2 px-lg-3 align-self-center" style="height: 50px" />
							</a>
						</div>

						<div class="d-flex justify-content-center align-items-center col col-6 col-lg-3 text-center mb-2 mb-lg-0">
							<a href="https://pkp.sfu.ca/" target="_blank">
								<img src="{$imageAssetPath}pkp_logo.png" class="px-5 py-2 py-lg-2 px-lg-3 align-self-center" style="height: 50px" />
							</a>
						</div>
					</div>

					<div class="pkp_footer_content">
						{$pageFooter}
					</div>
				</div>
			{/if}

			<!-- <div class="pkp_brand_footer" role="complementary">
				<a href="{url page="about" op="aboutThisPublishingSystem"}">
					<img alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
				</a>
			</div> -->
		</div>
	</div>
</footer><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
