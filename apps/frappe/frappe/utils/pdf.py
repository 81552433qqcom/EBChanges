# Copyright (c) 2013, Web Notes Technologies Pvt. Ltd. and Contributors
# MIT License. See license.txt

import pdfkit, os, frappe
from frappe.utils import scrub_urls

logger = frappe.get_logger()

def get_pdf(html, options=None):
	if not options:
		options = {}

	options.update({
		"print-media-type": None,
		"background": None,
		"images": None,
		'margin-top': '15mm',
		'margin-right': '15mm',
		'margin-bottom': '15mm',
		'margin-left': '15mm',
		'encoding': "UTF-8",
		'no-outline': None
	})

	if not options.get("page-size"):
		options['page-size'] = frappe.db.get_single_value("Print Settings", "pdf_page_size") or "A4"

	html = scrub_urls(html)
	fname = os.path.join("/tmp", frappe.generate_hash() + ".pdf")

	try:
		pdfkit.from_string(html, fname, options=options or {})
	except:
		logger.error("Generated Issue while creating pdf")

	with open(fname, "rb") as fileobj:
		filedata = fileobj.read()

	os.remove(fname)

	return filedata
