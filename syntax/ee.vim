" Language: Expression Engine Templates
" Maintainer: Josh Farneman
" Latest Revision: 17 February 2012

if exists("b:current_syntax")
  finish
  endif
  
  

" GLOBAL TEMPLATE VARIABLES

" Path vars
syn keyword eeTag path next_group="eeProperty" contained 
" Linking to stylesheets
syn keyword eeTag stylesheet next_group="eeProperty" contained 

" Standard Global vars
syn keyword eeParameter app_build app_version charset cp_url current_time debug_mode doc_url elapsed_time email group_id group_title gzip_mode hits homepage ip_address lang location member_group member_id member_profile_link screen_name site_name site_url template_edit_date total_comments theme_folder_url total_entries total_queries username webmaster_email XID_HASH contained
syn keyword eeTag redirect embed encode next_group="eeProperty" contained 
syn keyword eeParameter logged_in_member_id logged_in_group_id logged_in_group_description logged_in_username logged_in_screen_name logged_in_email logged_in_ip_address logged_in_location logged_in_total_entries logged_in_total_comments logged_in_private_messages logged_in_total_forum_topics logged_in_total_forum_replies logged_in_total_forum_posts contained

" Conditional Global vars
syn keyword eeConditional if else elseif switch contained

" URL Segment vars
syn match eeParameter "segment_[1-9]" contained 
syn keyword eeParameter last_segment contained

" Date variable formatting
syn keyword eeParameter format contained

" Addon parse order
syn keyword eeParameter parse contained



"
" 
syn keyword eeParameter auto_login logged_in logged_out contained
syn keyword eeParameter class id contained
syn keyword eeParameter title contained
syn keyword eeParameter limit category fixed_order url_title contained
syn keyword eeParameter site channel contained
syn keyword eeParameter cache refresh disable contained
syn keyword eeParameter error_handling return contained

syn keyword eeTag url_title_path next_group="eeProperty" contained 


" BASE EXPRESSION ENIGNE

syn match eeParameter "\w\+:\w\+" contained 

syn match eeProperty "['\"]\(\w\|-\|\/\| \||\|{\|}\|:\|\.\)\+['\"]" contained contains=eeBlock 

syn region eeBlock start="{" end="}" fold contains=eeConditional,eeTag,eeProperty,eeParameter,eeModule,eePreload

" Addon tags
syn match eeModule "exp\(:\w\+\)\+" contained 

" Preload Text Replacements
syn match eePreload "preload_replace\(:\w\+\)" contained 

" EE comments
syn region eeComment start="{!--" end="--}" 



" set highlighting
let b:current_syntax = "ee"

hi def link eeConditional Type
hi def link eeModule      Statement 
hi def link eeParameter   Constant
hi def link eeProperty    Constant
hi def link eeBlock       Statement
hi def link eeComment     Statement
hi def link eeTag         Type
hi def link eePreload     Type 
