{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}

<div class="page_index_site">
	<div class="journals">
		<!-- <h2>
			{translate key="context.contexts"}
		</h2> -->

		{if !$journals|@count}
			{translate key="site.noJournals"}
		{else}
			<ul class="journals-list fadeable faded" id="journals-list">
				<li class="journal-sizer col-12 col-md-6 col-lg-4 col-xl-4 col-xxl-4"></li>

				{foreach from=$journals item=journal}
					{if $journal->getPath() !== 'ps'}
						{capture assign="url"}{url journal=$journal->getPath()}{/capture}
						{assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
						{assign var="description" value=$journal->getLocalizedDescription()}

						<li class="journal-container {if $thumb}has_thumb{/if} col-12 col-md-6 col-lg-4 col-xl-4 col-xxl-4">
							<div class="journal">
								<a href="{$url|escape}" tabindex="-1">
									{if $thumb}
										<div class="journal-thumb-container thumb ratio" style="--bs-aspect-ratio: 50%;">
												<img class="journal-thumb" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape|default:''}"{/if}>
										</div>
									{else}
										<div class="journal-thumb-container thumb is-placeholder ratio" style="--bs-aspect-ratio: 50%;">
										</div>
									{/if}
								</a>

								<div class="journal-body body">
									<h3 class="journal-title">
										<a href="{$url|escape}" rel="bookmark">
											{$journal->getLocalizedName()}
										</a>
									</h3>

									{if $description}
										<div class="journal-description description">
											{$description|nl2br}
										</div>
									{/if}

									<ul class="journal-links links">
										<li class="view">
											<i class="journal-icon kbico-book-circle"></i>
											<a href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
												{translate key="plugins.themes.publicera_theme.site.journalCurrent"}
											</a>
										</li>
									</ul>
								</div>
							</div>
						</li>
					{/if}
				{/foreach}
			</ul>
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
