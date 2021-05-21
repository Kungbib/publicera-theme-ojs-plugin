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

	{if $about}
		<div class="about_site">
			{$about|nl2br}
		</div>
	{/if}

	<div class="journals">
		<h2>
			{translate key="context.contexts"}
		</h2>
		{if !$journals|@count}
			{translate key="site.noJournals"}
		{else}
			<ul class="journals-list">
				<li class="journal-sizer col-12 col-md-6 col-lg-4 col-xl-4 col-xxl-3"></li>
				{foreach from=$journals item=journal}
					{capture assign="url"}{url journal=$journal->getPath()}{/capture}
					{assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
					{assign var="description" value=$journal->getLocalizedDescription()}
					<li class="journal-container {if $thumb}has_thumb{/if} col-12 col-md-6 col-lg-4 col-xl-4 col-xxl-3">
						<div class="journal">
							{if $thumb}
								<div class="journal-thumb-container thumb ratio" style="--bs-aspect-ratio: 50%;">
									<a href="{$url|escape}">
										<img class="journal-thumb" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape|default:''}"{/if}>
									</a>
								</div>
							{else}
								<div class="journal-thumb-container thumb is-placeholder ratio" style="--bs-aspect-ratio: 50%;">
									placeholder
								</div>
							{/if}
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
										<a href="{$url|escape}">
											<span class="bi stack">
												<i class="bi bi-circle"></i>
												<i class="bi bi-book"></i>
											</span>
											{translate key="site.journalView"}
										</a>
									</li>
									<li class="current">
										<a href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
											<span class="bi stack">
												<i class="bi bi-circle"></i>
												<i class="bi bi-pen"></i>
											</span>
											{translate key="site.journalCurrent"}
										</a>
									</li>
								</ul>
							</div>
						</div>
					</li>
				{/foreach}
			</ul>
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
