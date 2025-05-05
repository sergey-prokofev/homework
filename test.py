import sentry_sdk

sentry_sdk.init(
    dsn="https://1daaf2f79b2da29978bf9fbdace7593c@o4509271574904832.ingest.de.sentry.io/4509271594434640",
    # Add data like request headers and IP for users,
    # see https://docs.sentry.io/platforms/python/data-management/data-collected/ for more info
    send_default_pii=True,
)



division_by_zero = 1 / 0