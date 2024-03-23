;; -*- lexical-binding: t; no-byte-compile: t -*-
(setq gc-cons-threshold most-positive-fixnum)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(setq frame-resize-pixelwise t)
(setq package-enable-at-startup nil)
